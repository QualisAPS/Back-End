import { Express } from 'express';
import { authRouter } from './authentication/authentication.router';

export const setupRoutes = (app: Express) => {
  app.use('/api', [authRouter]);
};
