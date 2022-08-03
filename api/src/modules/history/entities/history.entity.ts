import { Account } from 'src/auth/account.entity';
import { Movie } from 'src/modules/movie/entities/movie.entity';
import {
  BaseEntity,
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export enum HistoryType {
  'search' = 'search',
  'view' = 'view',
}

@Entity()
export class History extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;

  @DeleteDateColumn({ nullable: true })
  deletedAt: Date;

  @ManyToOne(() => Account)
  account: Account;

  @ManyToOne(() => Movie)
  movie: Movie;

  @Column({ type: 'enum', enum: HistoryType, default: HistoryType.view })
  type: HistoryType;
}
