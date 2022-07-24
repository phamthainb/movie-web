import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateGenreDto } from './dto/create-genre.dto';
import { UpdateGenreDto } from './dto/update-genre.dto';
import { Genre, GenreDocument } from './entities/genre.entity';

@Injectable()
export class GenreService {
  constructor(
    @InjectModel(Genre.name) private genereModel: Model<GenreDocument>,
  ) {}

  async create(createGenreDto: CreateGenreDto) {
    await this.genereModel.insertMany([createGenreDto]);
    return true;
  }

  findAll() {
    return `This action returns all genre`;
  }

  findOne(id: number) {
    return `This action returns a #${id} genre`;
  }

  update(id: number, updateGenreDto: UpdateGenreDto) {
    return `This action updates a #${id} genre`;
  }

  remove(id: number) {
    return `This action removes a #${id} genre`;
  }
}
