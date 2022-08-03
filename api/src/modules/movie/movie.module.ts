import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ActorModule } from '../actor/actor.module';
import { Actor } from '../actor/entities/actor.entity';
import { Tag } from '../tag/entities/tag.entity';
import { TagModule } from '../tag/tag.module';
import { Movie } from './entities/movie.entity';
import { MovieController } from './movie.controller';
import { MovieService } from './movie.service';

@Module({
  imports: [
    TypeOrmModule.forFeature([Movie, Tag, Actor]),
    ActorModule,
    TagModule,
  ],
  controllers: [MovieController],
  providers: [MovieService],
  exports: [MovieService],
})
export class MovieModule {}
