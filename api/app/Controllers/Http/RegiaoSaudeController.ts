import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RegiaoSaude from 'App/Models/RegiaoSaude'

export default class RegiaoSaudeController {
  public async index({}: HttpContextContract) {
    const data = await RegiaoSaude
      .query()

    return data
  }

  public async show({ params }: HttpContextContract) {
    try {
      const regiaoSaude = await RegiaoSaude.findOrFail(params.id)
      return regiaoSaude
    } catch (error) {
      return { error: 'Região de Saúde não encontrada.' }
    }
  }

  public async destroy({ params }: HttpContextContract) {
    try {
      const regiaoSaude = await RegiaoSaude.findOrFail(params.id)
      await regiaoSaude.delete()
      return { message: 'Região de Saúde deletada com sucesso.' }
    } catch (error) {
      return { error: 'Região de Saúde não encontrada.' }
    }
  }

  public async update({ params, request }: HttpContextContract) {
    try {
      const regiaoSaude = await RegiaoSaude.findOrFail(params.id)
      const dados = request.only(['nome', 'sigla'])
      regiaoSaude.merge(dados)
      await regiaoSaude.save()
      return regiaoSaude
    } catch (error) {
      return { error: 'Região de Saúde não encontrada.' }
    }
  }

  public async store({ request }: HttpContextContract) {
    const dados = request.only(['nome', 'sigla'])
    const regiaoSaude = await RegiaoSaude.create(dados)
    return regiaoSaude
  }
}
