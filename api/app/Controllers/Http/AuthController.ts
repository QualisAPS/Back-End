import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import User from 'App/Models/User'

export default class AuthController {
  public async login({ auth, request, response }: HttpContextContract) {
    const { email, password } = request.all()
    const user = await User.query().where('email', email)

    try {
      const token = await auth.attempt(email, password)
      return { token, user }
    } catch (error) {
      return response.unauthorized({ message: error })
    }
  }
}