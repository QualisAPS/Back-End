import { BaseModel,belongsTo,BelongsTo, column, hasMany,HasMany } from '@ioc:Adonis/Lucid/Orm'
import Gsap from './Gsap'
import Equipe from './Equipe'
export default class  RegiaoAdmin extends BaseModel {

  public static table = 'ubs'

  @column({ isPrimary: true })
  public id: number

  @column()
  public nome: string

  @column()
  public gsap: number

  @column()
  public sigla: string

  @column()
  public cnes: string

  @column()
  public tipo: string

  @column()
  public rural: string

  @column()
  public telefone: string

  @column()
  public endereco: string

  @column()
  public ponto_eletronico: string

  @column()
  public agd_acesso_avancado: string

  @column()
  public agd_ordem_chegada: string

  @column()
  public agd_bloco_horas: string 

  @column()
  public agd_horario_marcado: string 

  @column()
  public agd_turno: string 

  @column()
  public realiza_ecg_ubs: string 

  @column()
  public farmaciafornecimento_usuarios: string 

  @column()
  public presenca_supervisao_farmaceutico: string 

  @column()
  public dispensacao_psicotropico: string 

  @column()
  public coleta_laboratorial: string 

  @column()
  public imunizacao: string 

  @column()
  public horario_funcionamento_sala_vacina: string 

  @column()
  public bcg: string 

  @column()
  public formato_uso_esus_ab: string 

  @column()
  public cadeiras_odonto_funcionamento: string  

  @column()
  public esf_completas: string  

  @column()
  public esf_incompletas: string  

  @column()
  public total_esf: string  

  @column()
  public total_esb: string  

  @column()
  public total_nasf: string  

  @column()
  public total_ecr: string    

  @column()
  public total_prisional: string    

  @column()
  public total_equipe_socio_educativo: string    

  @column()
  public nu_min_ent_inloco: string    

  @column()
  public tipologia: string    

  @column()
  public horario_funcionamento: string    

  @column()
  public latitude: string    

  @column()
  public longitude: string   

  @belongsTo(() => Gsap)
  public gsap: BelongsTo<typeof Gsap>

  @hasMany(() => Equipe)
  public equipes: HasMany<typeof Equipe>
}
