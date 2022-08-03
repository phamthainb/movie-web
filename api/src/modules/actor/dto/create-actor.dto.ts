import { ApiProperty } from '@nestjs/swagger';
import { IsString } from 'class-validator';

export class CreateActorDto {
  @ApiProperty()
  @IsString()
  name: string;
}
