
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'
export default class UBS extends BaseModel {
  public static table = 'ubs'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public gsapId: number

  @column()
  public sigla: string

  @column()
  public cnes: string

  @column()
  public tipologia2022: string

  @column()
  public tipologia2020: string

  @column()
  public notaEquipePonderada: number

  @column()
  public notaProfissionalPonderada: number

  @column()
  public notaServicosPonderada: number

  @column()
  public notaEstruturaPonderada: number

  @column()
  public notaInsumosPonderada: number

  @column()
  public notaTicPonderada: number

  @column()
  public totalEsf: number
}
