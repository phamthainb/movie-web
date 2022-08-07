import { Controller, Get } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ActorService } from './actor.service';

@Controller('actor')
@ApiTags('actor')
export class ActorController {
  constructor(private readonly actorService: ActorService) {}

  @Get()
  findAll() {
    return this.actorService.findAll();
  }
}
