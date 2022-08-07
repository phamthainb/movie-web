import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsArray,
  IsNotEmpty,
  IsNumber,
  IsNumberString,
  IsOptional,
  IsString,
} from 'class-validator';
import { MovieStatus } from '../entities/movie.entity';

export class CreateMovieDto {
  @ApiProperty()
  @IsString()
  imdb: string;

  @ApiProperty()
  @IsString()
  originalTitle: string;

  @ApiProperty()
  @IsNumber()
  year: number;

  @ApiProperty()
  @IsNumber()
  duration: number;

  @ApiProperty()
  @IsString()
  director: string;

  @ApiProperty()
  @IsString()
  writer: string;

  @ApiProperty()
  @IsString()
  productionCompany: string;

  @ApiProperty()
  @IsArray()
  actors: string[];

  @ApiProperty()
  @IsString()
  description: string;

  @ApiProperty()
  @IsArray()
  tags: string[];
}

export class SearchMovieDto {
  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  originalTitle: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumberString()
  yearFrom: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumberString()
  yearTo: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumberString()
  durationFrom: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumberString()
  durationTo: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  director: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  writer: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  productionCompany: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  actor: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  description: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString()
  tag: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumberString()
  tagId: number;

  @ApiPropertyOptional({ enum: MovieStatus })
  @IsOptional()
  @IsNotEmpty()
  status: MovieStatus;
}
