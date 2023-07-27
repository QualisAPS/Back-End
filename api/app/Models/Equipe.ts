import { DateTime } from 'luxon'
import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
import UBS from './UBS'
export default class Equipe extends BaseModel {
  
  public static table = 'equipe'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public ubsId: number

  @column()
  public tx_ine: string


  @column()
  public ciclo_1: string


  @column()
  public equipe: string

  @belongsTo(() => UBS)
  public ubs: BelongsTo<typeof UBS>
}
