import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ActorRepository } from './actor.repository';
import { CreateActorDto } from './dto/create-actor.dto';
import { Actor } from './entities/actor.entity';

@Injectable()
export class ActorService {
  constructor(@InjectRepository(Actor) private actorRepo: ActorRepository) {}

  async createOrUpdate(createActorDto: CreateActorDto) {
    let a = await this.actorRepo.findOne({
      where: { name: createActorDto.name },
    });
    if (!a) {
      a = new Actor();
    }
    a.name = createActorDto.name;

    await this.actorRepo.save(a);

    return a;
  }

  findAll() {
    return this.actorRepo.find();
  }
}
