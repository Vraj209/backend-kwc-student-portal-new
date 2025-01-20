import express from "express";
import * as dotenv from "dotenv";
dotenv.config();

const app = express();

app.get("/", (req, res) => {
  res.send("welcome to student portal baps student");
});

app.listen(process.env.BACKEND_PORT, () => {
  console.log(
    `🟢 Server is running on http://localhost:${process.env.BACKEND_PORT}`
  );
});
