import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Equipe from 'App/Models/Equipe'
import Database from '@ioc:Adonis/Lucid/Database';

export default class EquipesController {
  public async index({}: HttpContextContract) {
    return await Database.query()
    .from('equipes')
    .select('equipes.*', 'gsap.nome as gsap_nome', 'regiao_admin.nome as ra_nome', 'regiao_saude. nome as rs_nome')
    .leftJoin('ubs', 'equipes.cnes', '=', 'ubs.cnes') 
    .leftJoin('gsap', 'ubs.gsap_id', '=', 'gsap.id')
    .leftJoin('regiao_admin', 'gsap.regiao_admin', '=', 'regiao_admin.id')
    .leftJoin('regiao_saude', 'regiao_admin.regiao_saude', '=', 'regiao_saude.id');
  }

  public async store({ request }: HttpContextContract) {
    const equipeData = request.only(['ine', 'nome', 'cert_1_ciclo', 'cert_nota_1_ciclo', 'cert_2_ciclo', 'cert_nota_2_ciclo'])
    const equipe = await Equipe.create(equipeData)
    return equipe
  }

  public async show({ params,response}: HttpContextContract) {
    try {
      const equipe = await Database
      .from('equipes')
      .select('equipes.*', 'gsap.nome as gsap_nome', 'regiao_admin.nome as ra_nome', 'regiao_saude. nome as rs_nome')
      .leftJoin('ubs', 'equipes.cnes', '=', 'ubs.cnes') 
      .leftJoin('gsap', 'ubs.gsap_id', '=', 'gsap.id')
      .leftJoin('regiao_admin', 'gsap.regiao_admin', '=', 'regiao_admin.id')
      .leftJoin('regiao_saude', 'regiao_admin.regiao_saude', '=', 'regiao_saude.id')
      .where('equipes.id', params.id)
      return equipe
    } catch (error) {
      return response.status(404).send({ error: 'Equipe não encontrada.' });
    }
  }

  public async update({ params, request }: HttpContextContract) {
    const equipe = await Equipe.findOrFail(params.id)
    equipe.merge(request.only(['ine', 'nome', 'cert_1_ciclo', 'cert_nota_1_ciclo', 'cert_2_ciclo', 'cert_nota_2_ciclo']))
    await equipe.save()
    return equipe
  }

  public async destroy({ params }: HttpContextContract) {
    const equipe = await Equipe.findOrFail(params.id)
    await equipe.delete()
    return equipe
  }
}
