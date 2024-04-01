import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import Ubs from 'App/Models/Ubs'; // Usando Ubs como o modelo correto para UBS

export default class UbsController {
  public async index({}: HttpContextContract) {
    return await Ubs.query();
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
      const ubs = await Ubs.findOrFail(params.id);
      return ubs;
    } catch (error) {
      return response.status(404).send({ error: 'UBS não encontrada.' });
    }
  }

  public async update({ params, request, response }: HttpContextContract) {
    let ubs;
    try {
      ubs = await Ubs.findOrFail(params.id);
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
      const ubs = await Ubs.findOrFail(params.id);
      await ubs.delete();
      return { message: 'UBS deletada com sucesso.' };
    } catch (error) {
      return response.status(404).send({ error: 'UBS não encontrada.' });
    }
  }
}
