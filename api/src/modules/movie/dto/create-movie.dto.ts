import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsArray, IsNumber, IsOptional, IsString } from 'class-validator';

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
  @IsNumber()
  yearFrom: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumber()
  yearTo: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumber()
  durationFrom: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsNumber()
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
}
