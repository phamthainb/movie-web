import { BullModule } from '@nestjs/bull';
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MulterModule } from '@nestjs/platform-express';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AuthModule } from './auth/auth.module';
import { BullBoardModule } from './bull-board.module';
import { ormConfig } from './common/configs/orm.config';
import { CronModule } from './cron/cron.module';
import { ActorModule } from './modules/actor/actor.module';
import { CollectionModule } from './modules/collection/collection.module';
import { CommentModule } from './modules/comment/comment.module';
import { MovieModule } from './modules/movie/movie.module';
import { TagModule } from './modules/tag/tag.module';

@Module({
  imports: [
    MulterModule.register({
      dest: './upload',
    }),
    BullModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        redis: {
          host: configService.get<string>('REDIS_HOST'),
          port: configService.get<number>('REDIS_PORT'),
          keyPrefix: 'movie',
        },
      }),
    }),
    BullBoardModule,
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: ormConfig,
      inject: [ConfigService],
    }),
    AuthModule,
    CronModule,
    MovieModule,
    TagModule,
    CommentModule,
    ActorModule,
    CollectionModule,
  ],
  controllers: [AppController],
  providers: [],
})
export class AppModule {}
