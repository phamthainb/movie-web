import { Exclude } from 'class-transformer';
import { EnumRole } from 'src/common/enums/role.enum';
import {
  BaseEntity,
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export enum LoginType {
  'gg' = 'gg',
  'normal' = 'normal',
}

@Entity('account')
export class Account extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;

  @DeleteDateColumn({ nullable: true })
  deletedAt: Date;

  @Column('varchar', { unique: true })
  username: string;

  @Exclude()
  @Column('varchar', { nullable: true })
  password: string;

  @Column('enum', { enum: EnumRole, default: EnumRole.USER })
  role: EnumRole;

  @Column({ type: 'enum', enum: LoginType, default: LoginType.normal })
  type: LoginType;

  @Column({ nullable: true })
  ggAccessToken: string;
}
