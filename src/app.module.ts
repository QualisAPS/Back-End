import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';

// IMPORT MODULES
import { HealthRegionModule } from './modules/health_region/health-region.module';

// IMPORT ENTITIES
import { HealthRegion } from './modules/health_region/entities';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (config: ConfigService) => ({
        type: 'postgres',
        host: config.get('DB_HOST', 'localhost'),
        port: config.get('DB_PORT', 5432),
        username: config.get('DB_USERNAME', 'admin'),
        password: config.get('DB_PASSWORD', 'senha123'),
        database: config.get('DB_DATABASE', 'qualis'),
        entities: [HealthRegion],
        synchronize: config.get('TYPEORM_SYNC') === 'true',
      }),
    }),
    HealthRegionModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
