import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import Equipe from 'App/Models/Equipe'

export default class EquipeController {
  public async index() {
    const data = await Equipe.all()
    return data
    
  }

  public async store() {
    return 1
  }
}
