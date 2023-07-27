import { test } from '@japa/runner'

test('display qualis aps', async ({ client }) => {
  const response = await client.get('/')

  response.assertStatus(200)
  response.assertBodyContains({ qualis: 'aps' })
})
