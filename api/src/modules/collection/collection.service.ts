import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { MovieService } from '../movie/movie.service';
import { CollectionRepository } from './collection.repository';
import {
  CreateCollectionDto,
  SearchCollectionDto,
} from './dto/create-collection.dto';
import { Collection } from './entities/collection.entity';

@Injectable()
export class CollectionService {
  constructor(
    private movieService: MovieService,
    @InjectRepository(Collection) private cRepo: CollectionRepository,
  ) {}

  async create(createCollectionDto: CreateCollectionDto) {
    const m = await this.movieService.findOne(+createCollectionDto.movie);

    if (!m) {
      throw new BadRequestException('Movie not found');
    }

    const c = new Collection();
    c.type = createCollectionDto.type;
    c.movie = m;
    await this.cRepo.save(c);
    return c;
  }

  async findAll(body: SearchCollectionDto) {
    const c = await this.cRepo
      .createQueryBuilder('c')
      .andWhere('c.type = :type', { type: body.type })
      .leftJoinAndSelect('c.movie', 'movie')
      .leftJoinAndSelect('movie.tag', 'tag')
      .leftJoinAndSelect('movie.actor', 'actor')
      .getMany();
    return c.map((k) => k.movie) ?? [];
  }
}
