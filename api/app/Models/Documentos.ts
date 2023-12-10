import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
export default class Equipe extends BaseModel {
  
  public static table = 'documentos'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public url: string

  @column()
  public categoria: string

}
