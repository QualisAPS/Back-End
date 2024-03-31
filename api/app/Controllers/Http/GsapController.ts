import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext';
import Gsap from 'App/Models/Gsap';
import RegiaoAdmin from 'App/Models/RegiaoAdmin';

export default class GsapController {
  public async index({}: HttpContextContract) {
    return await Gsap.query();
  }
  public async store({ request, response }: HttpContextContract) {
    const data = request.only(['nome', 'regiaoAdmin']);

    if (data.regiaoAdmin && !(await RegiaoAdmin.find(data.regiaoAdmin))) {
      return response.status(404).send({ error: 'Região Administrativa não encontrada.' });
    }

    const gsap = await Gsap.create(data);
    return gsap;
  }
  public async show({ params, response }: HttpContextContract) {
    try {
      const gsap = await Gsap.query()
        .where('id', params.id)
      return gsap;
    } catch (error) {
      return response.status(404).send({ error: 'GSAP não encontrada.' });
    }
  }
  public async update({ params, request, response }: HttpContextContract) {
    let gsap;
    try {
      gsap = await Gsap.findOrFail(params.id);
    } catch (error) {
      return response.status(404).send({ error: 'GSAP não encontrada.' });
    }

    const data = request.only(['nome', 'regiaoAdmin']);

    if (data.regiaoAdmin && !(await RegiaoAdmin.find(data.regiaoAdmin))) {
      return response.status(404).send({ error: 'Região Administrativa não encontrada.' });
    }

    gsap.merge(data);
    await gsap.save();
    return gsap;
  }

  public async destroy({ params, response }: HttpContextContract) {
    try {
      const gsap = await Gsap.findOrFail(params.id);
      await gsap.delete();
      return { message: 'GSAP deletada com sucesso.' };
    } catch (error) {
      return response.status(404).send({ error: 'GSAP não encontrada.' });
    }
  }
}
