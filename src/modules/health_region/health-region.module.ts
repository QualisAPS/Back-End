import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HealthRegionService } from './health-region.service';
import { HealthRegionController } from './health-region.controller';
import { HealthRegion } from './entities';

@Module({
  imports: [TypeOrmModule.forFeature([HealthRegion])],
  providers: [HealthRegionService],
  controllers: [HealthRegionController],
})
export class HealthRegionModule {}
