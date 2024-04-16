import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Gsap extends BaseModel {
  public static table = 'gsap'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public regiaoAdmin: number
}