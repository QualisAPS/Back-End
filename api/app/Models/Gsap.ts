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
  public regiaoAdmin: number | null

  @belongsTo(() => RegiaoAdmin)
  public regiao_admin: BelongsTo<typeof RegiaoAdmin>
}
