import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class UbsSchema extends BaseSchema {
  protected tableName = 'ubs'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').primary()
      table.string('nome').notNullable()
      table.integer('gsap_id').unsigned().references('id').inTable('gsap')
      table.string('sigla')
      table.string('cnes').notNullable()
      table.string('tipo')
      table.string('rural')
      table.string('telefone')
      table.string('endereco')
      table.string('ponto_eletronico')
      table.string('agd_acesso_avancado')
      table.string('agd_ordem_chegada')
      table.string('agd_bloco_horas')
      table.string('agd_horario_marcado')
      table.string('agd_turno')
      table.string('realiza_ecg_ubs')
      table.string('farmaciafornecimento_usuarios')
      table.string('presenca_supervisao_farmaceutico')
      table.string('dispensacao_psicotropico')
      table.string('coleta_laboratorial')
      table.string('imunizacao')
      table.string('horario_funcionamento_sala_vacina')
      table.string('bcg')
      table.string('formato_uso_esus_ab')
      table.string('cadeiras_odonto_funcionamento')
      table.string('esf_completas')
      table.string('esf_incompletas')
      table.string('total_esf')
      table.string('total_esb')
      table.string('total_nasf')
      table.string('total_ecr')
      table.string('total_prisional')
      table.string('total_equipe_socio_educativo')
      table.string('nu_min_ent_inloco')
      table.string('tipologia')
      table.string('horario_funcionamento')
      table.string('latitude')
      table.string('longitude')
      // Add other fields as necessary
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
