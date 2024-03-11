import { Entity, PrimaryGeneratedColumn, Column, BaseEntity } from 'typeorm';

@Entity('health_region')
export class HealthRegion extends BaseEntity {
  @PrimaryGeneratedColumn('uuid', { name: 'id' })
  id: string;

  @Column('timestamp with time zone', {
    name: 'created_at',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createdAt: Date;

  @Column('character varying', { name: 'name', nullable: true })
  name: string | null;

  @Column('character varying', { name: 'acronym', nullable: true })
  acronym: string | null;

  @Column('bigint', { name: 'health_region_code', nullable: true })
  healthRegionCode: number | null;
}
