import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import UBS from 'App/Models/UBS'

export default class UBSController {
  public async index() {

    // const data = await UBS.all()
    // return data

    const data = await UBS
    .query()
    .preload('gsap')

    return data
    
  }

  public async store() {
    return 1
  }
}
