import Route from '@ioc:Adonis/Core/Route'

Route.get('/', async () => {
  return { hello: 'world' }
})

Route.resource('regiao-saude', 'RegiaoSaudeController').apiOnly()
Route.resource('regiao-admin', 'RegiaoAdminController').apiOnly()
Route.resource('gsap', 'GsapController').apiOnly()
Route.resource('ubs', 'GsapController').apiOnly()


