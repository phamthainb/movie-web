import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber } from 'class-validator';
import { CollectionType } from '../entities/collection.entity';

export class CreateCollectionDto {
  @ApiProperty({ enum: CollectionType })
  @IsNotEmpty()
  type: CollectionType;

  @ApiProperty()
  @IsNumber()
  movie: string;
}

export class SearchCollectionDto {
  @ApiProperty({ enum: CollectionType })
  @IsNotEmpty()
  type: CollectionType;
}
