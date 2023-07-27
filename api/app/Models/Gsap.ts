import { DateTime } from 'luxon'
import { BaseModel, column, hasMany,HasMany, belongsTo,BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import UBS from './UBS'
import RegiaoAdmin from './RegiaoAdmin'
export default class Gsap extends BaseModel {

  public static table = 'gsap'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public regiaoAdminId: number | null


  //@hasMany(() => UBS)
  //public regioes_administrativas: HasMany<typeof RegiaoAdmin>
}
