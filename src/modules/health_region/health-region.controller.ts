import { Controller, Get } from '@nestjs/common';
import { HealthRegionService } from './health-region.service';
import { HealthRegion } from './entities';

@Controller('health-regions')
export class HealthRegionController {
  constructor(private readonly healthRegionService: HealthRegionService) {}

  @Get()
  findAll(): Promise<HealthRegion[]> {
    return this.healthRegionService.findAll();
  }

  // Adicione mais endpoints conforme necessário
}
