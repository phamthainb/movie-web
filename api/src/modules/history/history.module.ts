import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Account } from 'src/auth/account.entity';
import { Movie } from '../movie/entities/movie.entity';
import { History } from './entities/history.entity';
import { HistoryController } from './history.controller';
import { HistoryService } from './history.service';

@Module({
  imports: [TypeOrmModule.forFeature([History, Movie, Account])],
  controllers: [HistoryController],
  providers: [HistoryService],
})
export class HistoryModule {}
