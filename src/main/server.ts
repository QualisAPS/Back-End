import { app } from "./app";

(async (): Promise<void> => {
  const serverApp = await app();
  const port = 9000;
  serverApp.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
})();

