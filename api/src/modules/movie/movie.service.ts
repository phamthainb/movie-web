import * as ffmpegInstaller from '@ffmpeg-installer/ffmpeg';
import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import * as ffmpeg from 'fluent-ffmpeg';
import { existsSync, mkdirSync } from 'fs';
import { join } from 'path';
import { cwd } from 'process';
import { ActorService } from '../actor/actor.service';
import { TagService } from '../tag/tag.service';
import { CreateMovieDto, SearchMovieDto } from './dto/create-movie.dto';
import { UpdateMovieDto } from './dto/update-movie.dto';
import { Movie, MovieStatus } from './entities/movie.entity';
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

  async addMedia(
    id: number,
    files: {
      img?: Express.Multer.File[];
      video?: Express.Multer.File[];
    },
  ) {
    const m = await this.findOne(id);

    if (!m) {
      throw new BadRequestException('Movie not found');
    }

    if (files?.img?.length > 0) {
      m.image = files.img[0].path;
    }

    if (files?.video?.length > 0) {
      const vid = files.video[0];
      const vidName = vid.originalname.split('.')[0];
      const outPath = `upload/m3u8/${vidName}`;

      // check if outputDir exist
      if (!existsSync(outPath)) {
        mkdirSync(outPath, { recursive: true });
      }

      ffmpeg.setFfmpegPath(ffmpegInstaller.path);

      ffmpeg(join(cwd(), vid.path), { timeout: 15 * 1000 })
        .addOptions([
          '-profile:v baseline',
          '-level 3.0',
          '-start_number 0',
          '-hls_time 10',
          '-hls_list_size 0',
          '-f hls',
        ])
        .output(join(cwd(), outPath, `${vidName}.m3u8`))
        .on('error', function (err, stdout, stderr) {
          if (err) {
            console.log(err.message);
            console.log('stdout:\n' + stdout);
            console.log('stderr:\n' + stderr);
          }
        })
        .on('end', () => {
          console.log('end');
        })
        .run();
      //

      m.status = MovieStatus.done;
    }

    return this.mRepo.save(m);
  }

  async findAll(body: SearchMovieDto) {
    const m = this.mRepo
      .createQueryBuilder('m')
      .leftJoinAndSelect('m.tag', 'tag')
      .leftJoinAndSelect('m.actor', 'actor');

    // validate
    if (body.tag) {
      m.andWhere('LOWER(tag.name) like :tag', {
        tag: `%${body.tag.toLowerCase()}%`,
      });
    }
    if (body.tagId) {
      m.andWhere('tag.id = :tagId', { tagId: body.tagId });
    }
    if (body.actor) {
      m.andWhere('LOWER(actor.name) like :actor', {
        actor: `%${body.actor.toLowerCase()}%`,
      });
    }
    if (body.status) {
      m.andWhere('m.status = :status', { status: body.status });
    }

    if (body.originalTitle) {
      m.andWhere('LOWER(m.originalTitle) like :originalTitle', {
        originalTitle: `%${body.originalTitle.toLowerCase()}%`,
      });
    }

    if (body.director) {
      m.andWhere('LOWER(m.director) like :director', {
        director: `%${body.director.toLowerCase()}%`,
      });
    }

    if (body.productionCompany) {
      m.andWhere('LOWER(m.productionCompany) like :productionCompany', {
        productionCompany: `${body.productionCompany.toLowerCase()}`,
      });
    }

    if (body.durationFrom) {
      m.andWhere('m.duration >= :durationFrom', {
        durationFrom: body.durationFrom,
      });
    }

    if (body.durationTo) {
      m.andWhere('m.duration <= :durationTo', {
        durationTo: body.durationTo,
      });
    }

    if (body.yearFrom) {
      m.andWhere('m.year >= :durationFrom', {
        durationFrom: body.yearFrom,
      });
    }

    if (body.yearTo) {
      m.andWhere('m.year <= :durationTo', {
        durationTo: body.yearTo,
      });
    }

    return m.getMany();
  }

  async findOne(id: number) {
    return this.mRepo.findOne({
      where: { id: id },
      relations: ['tag', 'actor'],
    });
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
