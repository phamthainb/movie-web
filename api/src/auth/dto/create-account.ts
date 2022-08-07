import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';

export class CreateAccountDto {
  @ApiProperty()
  @IsNotEmpty()
  username: string;

  @ApiProperty()
  @IsNotEmpty()
  password: string;

  // @IsNotEmpty()
  // @ApiProperty({ enum: EnumRole, default: EnumRole.USER })
  // role: EnumRole;
}
