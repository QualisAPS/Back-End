import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { HealthRegion } from './entities';

@Injectable()
export class HealthRegionService {
  constructor(
    @InjectRepository(HealthRegion)
    private healthRegionRepository: Repository<HealthRegion>,
  ) {}

  async findAll(): Promise<HealthRegion[]> {
    return await this.healthRegionRepository.find();
  }

  // Adicione mais métodos conforme necessário, como findById, create, update, delete, etc.
}
