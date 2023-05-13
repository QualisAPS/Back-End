import { Router } from 'express';

export const authRouter = Router();

authRouter.get('/', (request, response) => {
  return response.json({ message: 'Bora la!!' });
});
