import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateTagDto } from './dto/create-tag.dto';
import { UpdateTagDto } from './dto/update-tag.dto';
import { Tag } from './entities/tag.entity';
import { TagRepository } from './tag.repository';

@Injectable()
export class TagService {
  constructor(@InjectRepository(Tag) private tagRepo: TagRepository) {}

  create(createTagDto: CreateTagDto) {
    return this.tagRepo.save(createTagDto);
  }

  async createOrUpdate(createTagDto: CreateTagDto) {
    let a = await this.tagRepo.findOne({
      where: { name: createTagDto.name },
    });

    if (!a) {
      a = new Tag();
    }

    a.name = createTagDto.name;

    await this.tagRepo.save(a);

    return a;
  }

  findAll() {
    return this.tagRepo.find();
  }

  findOne(id: number) {
    return this.tagRepo.findOne({ where: { id: id } });
  }

  async update(id: number, updateTagDto: UpdateTagDto) {
    const a = await this.tagRepo.findOne({ where: { id: id } });
    if (!a) {
      throw new BadRequestException('Not found');
    }
    await this.tagRepo.save({ ...a, name: updateTagDto.name });
    return a;
  }

  async remove(id: number) {
    const a = await this.tagRepo.findOne({ where: { id: id } });
    if (!a) {
      throw new BadRequestException('Not found');
    }
    return this.tagRepo.softRemove(a);
  }
}
