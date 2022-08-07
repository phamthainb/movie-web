import { CACHE_MANAGER, Inject, Injectable, UseGuards } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import {
  OnGatewayConnection,
  OnGatewayDisconnect,
  OnGatewayInit,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Cache } from 'cache-manager';
import * as jwt from 'jsonwebtoken';
import { Server } from 'socket.io';
import { Account } from 'src/auth/account.entity';
import { AuthService } from 'src/auth/auth.service';
import { AuthPayload } from 'src/auth/interface/auth-payload.interface';
import { WsAuthGuard } from 'src/common/guard/ws-auth.guard';
import { SocketWithAccount } from 'src/websocket/interface/socket.interface';

export const socketIdToAccountId: Record<string, number> = {};
export const accountIdToSocketId: Record<number, string> = {};

@WebSocketGateway()
@Injectable()
export class CommentSocket
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect
{
  constructor(
    @Inject(CACHE_MANAGER) private cacheManager: Cache,
    private readonly authService: AuthService,
    private configService: ConfigService,
  ) {}

  @WebSocketServer() server: Server;

  private room: {
    socketId: string;
    room: any;
    account: Account;
  }[] = [];

  afterInit(server: Server) {
    server.use(async (socket: SocketWithAccount, next: (err?: any) => void) => {
      try {
        const currentAccount = socket.account;
        if (currentAccount) {
          return next();
        }
        const token = socket.handshake?.headers?.authorization?.split(' ')[1];

        if (!token) {
          return next();
        }
        const payload = jwt.verify(
          token,
          this.configService.get<string>('SECRET_KEY'),
        ) as AuthPayload;

        if (!payload.id) {
          return next();
        }

        const account = await this.authService.findOneById(payload.id);
        if (account) {
          socket.account = account;
        }
      } finally {
        return next();
      }
    });
  }

  async handleConnection(socket: SocketWithAccount) {
    // console.log('socket', socket.handshake.query);

    if (!socket.account) {
      console.log('handleConnection Unauthorize');
    } else {
      socketIdToAccountId[socket.id] = socket.account.id;
      accountIdToSocketId[socket.account.id] = socket.id;

      this.room.push({
        socketId: socket.id,
        room: socket?.handshake?.query?.movieId,
        account: socket.account,
      });
    }
  }

  async handleDisconnect(socket: SocketWithAccount) {
    if (!socket.account) {
      console.log('handleDisconnect Unauthorize');
    } else {
      delete socketIdToAccountId[socket.id];
      delete accountIdToSocketId[socket.account.id];

      this.room = this.room.filter((k) => k.socketId != socket.id);
    }
  }

  @UseGuards(WsAuthGuard)
  @SubscribeMessage('comment_typing')
  async onMessage(socket: SocketWithAccount, payload: { movieId: number }) {
    console.log('this.room.length', this.room.length);

    for (let i = 0; i < this.room.length; i++) {
      const el = this.room[i];

      if (el.room == payload.movieId && el.socketId !== socket.id) {
        socket.to(el.socketId).emit('people_is_typing', {
          user: socket.account.username,
        });
      }
    }
  }

  @UseGuards(WsAuthGuard)
  @SubscribeMessage('comment_post')
  async onMessagePost(socket: SocketWithAccount, payload: { movieId: number }) {
    for (let i = 0; i < this.room.length; i++) {
      const el = this.room[i];

      if (el.room == payload.movieId && el.socketId !== socket.id) {
        socket.to(el.socketId).emit('comment_reload');
      }
    }
  }
}
