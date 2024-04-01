import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
export default class UsersController {

    public async store({ response, request }: HttpContextContract) {
    
        const data = request.only(['nome', 'cpf', 'email', 'matricula', 'password'])
        const user = await User.create(data)
        return response.ok({ user })
      }
}
