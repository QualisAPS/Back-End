import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'
export default class Equipe extends BaseModel {
  public static table = 'equipes'

  @column({ isPrimary: true })
  public id: number

  @column()
  public ine: string

  @column()
  public nome: string

  @column()
  public cert_1_ciclo: string

  @column()
  public cert_nota_1_ciclo: number

  @column()
  public cert_2_ciclo: string

  @column()
  public cert_nota_2_ciclo: number
}