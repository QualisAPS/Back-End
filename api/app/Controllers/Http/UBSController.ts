import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import UBS from 'App/Models/UBS'
import Database from '@ioc:Adonis/Lucid/Database';
export default class UbsController {
  public async index({}: HttpContextContract) {
    return await Database.query()
    .from('ubs')
    .select('ubs.*', 'gsap.nome as gsap_nome', 'regiao_admin.nome as ra_nome', 'regiao_saude. nome as rs_nome') 
    .leftJoin('gsap', 'ubs.gsap_id', '=', 'gsap.id')
    .leftJoin('regiao_admin', 'gsap.regiao_admin', '=', 'regiao_admin.id')
    .leftJoin('regiao_saude', 'regiao_admin.regiao_saude', '=', 'regiao_saude.id');


  }

  public async store({ request, response }: HttpContextContract) {
    const data = request.only([
      'nome',
      'gsapId',
      'sigla',
      'cnes',
      'tipo',
      'rural',
      'telefone',
      'endereco',
      'ponto_eletronico',
      'agd_acesso_avancado',
      // etc etc...
    ]);

    try {
      const ubs = await Ubs.create(data);
      return ubs;
    } catch (error) {
      return response.status(500).send({ error: 'Erro ao criar UBS' });
    }
  }

  public async show({ params, response }: HttpContextContract) {
    try {
      const ubs = await Database
      .from('ubs')
      .select('ubs.*', 'gsap.nome as gsap_nome', 'regiao_admin.nome as ra_nome', 'regiao_saude.nome as rs_nome')
      .leftJoin('gsap', 'ubs.gsap_id', '=', 'gsap.id')
      .leftJoin('regiao_admin', 'gsap.regiao_admin', '=', 'regiao_admin.id')
      .leftJoin('regiao_saude', 'regiao_admin.regiao_saude', '=', 'regiao_saude.id')
      .where('ubs.id', params.id)
      return ubs
    } catch (error) {
      return response.status(404).send({ error: 'UBS não encontrada.' });
    }
  }

  public async update({ params, request, response }: HttpContextContract) {
    let ubs;
    try {
      ubs = await UBS.findOrFail(params.id);
    } catch (error) {
      return response.status(404).send({ error: 'UBS não encontrada.' });
    }

    const data = request.only([
      // Lista dos campos que podem ser atualizados
      'nome',
      'gsapId',
      // etc etc..
    ]);

    ubs.merge(data);
    await ubs.save();
    return ubs;
  }

  public async destroy({ params, response }: HttpContextContract) {
    try {
      const ubs = await UBS.findOrFail(params.id);
      await ubs.delete();
      return { message: 'UBS deletada com sucesso.' };
    } catch (error) {
      return response.status(404).send({ error: 'UBS não encontrada.' });
    }
  }
}
