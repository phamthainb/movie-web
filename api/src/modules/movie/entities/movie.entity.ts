import { Actor } from 'src/modules/actor/entities/actor.entity';
import { Tag } from 'src/modules/tag/entities/tag.entity';
import {
  BaseEntity,
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export enum MovieStatus {
  'new' = 'new',
  'uploading' = 'uploading',
  'done' = 'done',
}
@Entity()
export class Movie extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;

  @DeleteDateColumn({ nullable: true })
  deletedAt: Date;

  @Column()
  imdb: string;

  @Column()
  originalTitle: string;

  @Column()
  year: number;

  @Column()
  duration: number;

  @Column()
  director: string;

  @Column()
  writer: string;

  @Column()
  productionCompany: string;

  @Column()
  description: string;

  @Column({ default: 0, type: 'float' })
  avgVote: number;

  @Column({ default: 0, type: 'float' })
  votes: number;

  @ManyToMany(() => Tag)
  @JoinTable({ name: 'movie_tag' })
  tag: Tag[];

  @ManyToMany(() => Actor, { nullable: true })
  @JoinTable({ name: 'movie_actor' })
  actor: Actor[];

  //
  @Column({ nullable: true })
  url: string;

  @Column({ nullable: true })
  image: string;

  @Column({ type: 'enum', enum: MovieStatus, default: MovieStatus.new })
  status: MovieStatus;
}
