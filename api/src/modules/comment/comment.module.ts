import { CacheModule, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from 'src/auth/auth.module';
import { MovieModule } from '../movie/movie.module';
import { CommentController } from './comment.controller';
import { CommentService } from './comment.service';
import { CommentSocket } from './comment.socket';
import { Comment } from './entities/comment.entity';

@Module({
  imports: [
    CacheModule.register(),
    TypeOrmModule.forFeature([Comment]),
    AuthModule,
    MovieModule,
  ],
  controllers: [CommentController],
  providers: [CommentService, CommentSocket],
  exports: [CommentSocket],
})
export class CommentModule {}
