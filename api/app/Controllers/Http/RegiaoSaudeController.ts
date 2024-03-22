import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RegiaoSaude from 'App/Models/RegiaoSaude'

export default class RegiaoSaudeController {
  public async index({}: HttpContextContract) {
    const data = await RegiaoSaude
      .query()

    return data
  }

  // Visualizar uma única região de saúde pelo ID
  public async show({ params }: HttpContextContract) {
    try {
      const regiaoSaude = await RegiaoSaude.findOrFail(params.id)
      return regiaoSaude
    } catch (error) {
      return { error: 'Região de Saúde não encontrada.' }
    }
  }

  // Deletar uma região de saúde com base no ID
  public async destroy({ params }: HttpContextContract) {
    try {
      const regiaoSaude = await RegiaoSaude.findOrFail(params.id)
      await regiaoSaude.delete()
      return { message: 'Região de Saúde deletada com sucesso.' }
    } catch (error) {
      return { error: 'Região de Saúde não encontrada.' }
    }
  }

  // Atualizar uma região de saúde com base no ID
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

  // Função para criar uma nova região de saúde
  public async store({ request }: HttpContextContract) {
    const dados = request.only(['nome', 'sigla'])
    const regiaoSaude = await RegiaoSaude.create(dados)
    return regiaoSaude
  }
}
