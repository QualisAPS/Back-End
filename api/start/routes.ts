import Route from '@ioc:Adonis/Core/Route'

Route.get('/', async () => {
  return { qualis: 'aps' }
})

Route.resource('regiao-saude', 'RegiaoSaudeController').apiOnly()
Route.resource('regiao-admin', 'RegiaoAdminController').apiOnly()
Route.resource('gsap', 'GsapController').apiOnly()
Route.resource('ubs', 'UBSController').apiOnly()
Route.resource('equipes', 'EquipesController').apiOnly()
Route.resource('documentos', 'DocumentosController').apiOnly()
Route.resource('usuarios', 'UsersController').apiOnly()

Route.post('auth/login', 'AuthController.login')



