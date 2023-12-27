import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import Documentos from 'App/Models/Documentos'

export default class EquipeController {
  public async index() {

    // const data = await UBS.all()
    // return data

    const data = await Documentos.all()
    return data
    
  }

  public async store() {
    return 1
  }
}
