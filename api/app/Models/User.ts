import { DateTime } from 'luxon'
import { v4 as uuidv4 } from 'uuid'

import {
  BaseModel,
  beforeCreate,
  beforeSave,
  column,
  HasMany,
  hasMany,
  ManyToMany,
  manyToMany,
} from '@ioc:Adonis/Lucid/Orm'
import Hash from '@ioc:Adonis/Core/Hash'

import { compose } from '@ioc:Adonis/Core/Helpers'
//import { Filterable } from '@ioc:Adonis/Addons/LucidFilter'
import Role from './Role'

export default class User extends BaseModel {

  @column({ isPrimary: true })
  public id: number

  @column()
  public oldId: string

  @column({ serializeAs: null })
  public rememberMeToken?: string

  @column()
  public nome: string

  @column()
  public cpf: string

  @column()
  public email: string

  @column({ serializeAs: null })
  public password: string

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @manyToMany(() => Role, {
    pivotTable: 'usuario_equipes',
  })
  public roles: ManyToMany<typeof Role>


  @beforeSave()
  public static async hashPassword(user: User) {
    if (user.$dirty.password) {
      user.password = await Hash.make(user.password)
    }
  }
}