import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RegiaoAdmin from 'App/Models/RegiaoAdmin'
import RegiaoSaude from 'App/Models/RegiaoSaude'

export default class RegiaoAdminController {
  // Listar todas as regiões administrativas
  public async index({}: HttpContextContract) {
    return await RegiaoAdmin.query()
  }

  public async store({ request, response }: HttpContextContract) {
    const dados = request.only(['nome', 'regiaoSaude'])

    if (dados.regiaoSaude && !(await RegiaoSaude.find(dados.regiaoSaude))) {
      return response.status(404).send({ error: 'Região de Saúde não encontrada.' })
    }

    const regiaoAdmin = await RegiaoAdmin.create(dados)
    return regiaoAdmin
  }

  public async show({ params, response }: HttpContextContract) {
    try {
      const regiaoAdmin = await RegiaoAdmin.findOrFail(params.id)
      return regiaoAdmin
    } catch (error) {
      return response.status(404).send({ error: 'Região Administrativa não encontrada.' })
    }
  }

  public async update({ params, request, response }: HttpContextContract) {
    let regiaoAdmin
    try {
      regiaoAdmin = await RegiaoAdmin.findOrFail(params.id)
    } catch (error) {
      return response.status(404).send({ error: 'Região Administrativa não encontrada.' })
    }

    const dados = request.only(['nome', 'regiaoSaude'])

    if (dados.regiaoSaude && !(await RegiaoSaude.find(dados.regiaoSaude))) {
      return response.status(404).send({ error: 'Região de Saúde não encontrada.' })
    }

    regiaoAdmin.merge(dados)
    await regiaoAdmin.save()
    return regiaoAdmin
  }

  public async destroy({ params, response }: HttpContextContract) {
    try {
      const regiaoAdmin = await RegiaoAdmin.findOrFail(params.id)
      await regiaoAdmin.delete()
      return { message: 'Região Administrativa deletada com sucesso.' }
    } catch (error) {
      return response.status(404).send({ error: 'Região Administrativa não encontrada.' })
    }
  }
}
