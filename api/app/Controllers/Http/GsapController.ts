import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import Gsap from 'App/Models/Gsap'

export default class GsapController {
  public async index() {

    const data = await Gsap.all()
    return data
  }

  public async store() {
    return 1
  }
}
