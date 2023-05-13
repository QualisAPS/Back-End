import express from 'express';
import { Express } from 'express';
import cors from 'cors';
import { setupRoutes } from './routes';

export const app = async (): Promise<Express> => {
  const expressApp = express();
  expressApp.use(cors());
  setupRoutes(expressApp);
  return expressApp;
};
