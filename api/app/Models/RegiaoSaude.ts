import { BaseModel, column, hasMany,HasMany } from '@ioc:Adonis/Lucid/Orm'
import RegiaoAdmin from './RegiaoAdmin'

export default class RegiaoSaude extends BaseModel {

  public static table = 'regiao_saude'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public sigla: string

  @hasMany(() => RegiaoAdmin)
  public regioes_administrativas: HasMany<typeof RegiaoAdmin>
}
