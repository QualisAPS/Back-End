import { BaseModel, column, belongsTo, BelongsTo } from '@ioc:Adonis/Lucid/Orm'
export default class Documentos extends BaseModel {
  
  public static table = 'documentos'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public descricao: string

  @column()
  public categoria: string

  @column()
  public url: string



}
