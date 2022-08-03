import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ActorService } from '../actor/actor.service';
import { TagService } from '../tag/tag.service';
import { CreateMovieDto, SearchMovieDto } from './dto/create-movie.dto';
import { UpdateMovieDto } from './dto/update-movie.dto';
import { Movie } from './entities/movie.entity';
import { MovieRepository } from './movie.repository';

@Injectable()
export class MovieService {
  constructor(
    @InjectRepository(Movie) private mRepo: MovieRepository,
    private actorService: ActorService,
    private tagService: TagService,
  ) {}

  async create(createMovieDto: CreateMovieDto) {
    const { tags, actors, ...rest } = createMovieDto;
    const c = Object.assign(new Movie(), { ...rest });

    // check tag
    const t = [];
    for (let i = 0; i < createMovieDto.tags.length; i++) {
      const el = createMovieDto.tags[i];
      const tag = await this.tagService.createOrUpdate({ name: el });
      t.push(tag);
    }
    c.tag = t;

    // check actor
    const actor = [];
    for (let i = 0; i < createMovieDto.actors.length; i++) {
      const el = createMovieDto.actors[i];
      const acc = await this.actorService.createOrUpdate({ name: el });
      actor.push(acc);
    }
    c.actor = actor;

    return this.mRepo.save(c);
  }

  async findAll(body: SearchMovieDto) {
    const m = this.mRepo
      .createQueryBuilder('m')
      .leftJoinAndSelect('m.tag', 'tag')
      .leftJoinAndSelect('m.actor', 'actor');
    // validate
    if (body.tag) {
      m.andWhere('tag.name like :tag', { tag: `%${body.tag}%` });
    }
    if (body.actor) {
      m.andWhere('actor.name like :actor', { actor: `%${body.actor}%` });
    }

    return m.getMany();
  }

  async findOne(id: number) {
    return this.mRepo.findOne({ where: { id: id } });
  }

  async update(id: number, updateMovieDto: UpdateMovieDto) {
    const m = await this.findOne(id);

    if (!m) {
      throw new BadRequestException('Movie not found');
    }
    const { tags, actors, ...rest } = updateMovieDto;

    if (updateMovieDto.actors) {
      // check actor
      const actor = [];
      for (let i = 0; i < updateMovieDto.actors.length; i++) {
        const el = updateMovieDto.actors[i];
        const acc = await this.actorService.createOrUpdate({ name: el });
        actor.push(acc);
      }
      m.actor = actor;
    }

    if (updateMovieDto.tags) {
      // check tags
      const actor = [];
      for (let i = 0; i < updateMovieDto.tags.length; i++) {
        const el = updateMovieDto.tags[i];
        const acc = await this.tagService.createOrUpdate({ name: el });
        actor.push(acc);
      }
      m.tag = actor;
    }

    return this.mRepo.update(id, { ...rest });
  }

  async remove(id: number) {
    const m = await this.findOne(id);
    if (!m) {
      throw new BadRequestException('Movie not found');
    }
    return this.mRepo.softDelete(id);
  }
}
