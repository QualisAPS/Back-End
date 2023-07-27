import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import RegiaoAdmin from 'App/Models/RegiaoAdmin'

export default class RegiaoAdminController {
  public async index() {
    // const data = await RegiaoAdmin.all()
    // return data

    const data = await RegiaoAdmin
    .query()
    .preload('regiao_saude')

    return data
  }

  public async store() {
    return 1
  }
}
