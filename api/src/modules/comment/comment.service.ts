import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Account } from 'src/auth/account.entity';
import { Repository } from 'typeorm';
import { MovieService } from '../movie/movie.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentDto } from './dto/update-comment.dto';
import { Comment } from './entities/comment.entity';

@Injectable()
export class CommentService {
  constructor(
    @InjectRepository(Comment) private cRepo: Repository<Comment>,
    private movieService: MovieService,
  ) {}
  async create(createCommentDto: CreateCommentDto, user: Account) {
    const c = new Comment();

    c.status = true;
    c.account = user;
    c.movie = await this.movieService.findOne(createCommentDto.movie);
    c.content = createCommentDto.content;

    await this.cRepo.save(c);
    return c;
  }

  async findAll(body: UpdateCommentDto) {
    const c = await this.cRepo.find({
      where: { movie: { id: body.movie } },
      relations: ['account'],
    });
    return c;
  }

  remove(id: number) {
    return `This action removes a #${id} comment`;
  }
}
