import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MovieModule } from '../movie/movie.module';
import { CollectionController } from './collection.controller';
import { CollectionService } from './collection.service';
import { Collection } from './entities/collection.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Collection]), MovieModule],
  controllers: [CollectionController],
  providers: [CollectionService],
})
export class CollectionModule {}
