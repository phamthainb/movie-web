import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ActorRepository } from './actor.repository';
import { CreateActorDto } from './dto/create-actor.dto';
import { UpdateActorDto } from './dto/update-actor.dto';
import { Actor } from './entities/actor.entity';

@Injectable()
export class ActorService {
  constructor(@InjectRepository(Actor) private actorRepo: ActorRepository) {}
  create(createActorDto: CreateActorDto) {
    return 'This action adds a new actor';
  }

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
    return `This action returns all actor`;
  }

  findOne(id: number) {
    return `This action returns a #${id} actor`;
  }

  update(id: number, updateActorDto: UpdateActorDto) {
    return `This action updates a #${id} actor`;
  }

  remove(id: number) {
    return `This action removes a #${id} actor`;
  }
}
