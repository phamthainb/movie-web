import { BullModule } from '@nestjs/bull';
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { ormConfig } from './common/configs/orm.config';
import { CronModule } from './cron/cron.module';
import { MessageModule } from './message/message.module';
import { ActorModule } from './modules/actor/actor.module';
import { CollectionModule } from './modules/collection/collection.module';
import { CommentModule } from './modules/comment/comment.module';
import { HistoryModule } from './modules/history/history.module';
import { MovieModule } from './modules/movie/movie.module';
import { TagModule } from './modules/tag/tag.module';
import { WsModule } from './websocket/websocket.module';

@Module({
  imports: [
    MulterModule.register({
      dest: './upload',
    }),
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: ormConfig,
      inject: [ConfigService],
    }),
    // ServeStaticModule.forRoot({ rootPath: join(__dirname, '..', 'upload') }),
    AuthModule,
    WsModule,
    MessageModule,
    CronModule,
    BullModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        redis: {
          host: configService.get<string>('REDIS_HOST'),
          port: configService.get<number>('REDIS_PORT'),
        },
      }),
    }),
    MovieModule,
    TagModule,
    CommentModule,
    ActorModule,
    CollectionModule,
    HistoryModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
