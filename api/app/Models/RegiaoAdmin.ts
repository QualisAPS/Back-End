import { DateTime } from 'luxon'
import { BaseModel,belongsTo,BelongsTo, column, hasMany,HasMany } from '@ioc:Adonis/Lucid/Orm'
import RegiaoSaude from './RegiaoSaude'
import Gsap from './Gsap'

export default class  RegiaoAdmin extends BaseModel {

  public static table = 'regiao_admin'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public regiaoSaude: number | null

  @belongsTo(() => RegiaoSaude)
  public regiao_saude: BelongsTo<typeof RegiaoSaude>

  @hasMany(() => Gsap)
  public gsaps: HasMany<typeof Gsap>
}
