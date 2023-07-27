import { DateTime } from 'luxon'
import { BaseModel,belongsTo,BelongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import RegiaoSaude from './RegiaoSaude'

export default class RegiaoAdmin extends BaseModel {

  public static table = 'regiao_admin'

  @column({ isPrimary: true })
  public id: number

  @column({ isPrimary: true })
  public nome: string

  @column()
  public regiaoSaudeId: number | null

  @belongsTo(() => RegiaoSaude)
  public regiao_saude: BelongsTo<typeof RegiaoSaude>
}
