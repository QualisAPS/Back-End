import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import RegiaoSaude from 'App/Models/RegiaoSaude'

export default class RegiaoSaudeController {
  public async index() {
    const data = await RegiaoSaude
    .query()
    .preload('regioes_administrativas')

    return data
  }

  public async store() {
    return 1
  }
}
