import express from "express";
import produkController from "../controller/produk-controller.js";
import { authMiddleware } from "../middleware/auth-middleware.js";

const privateRouter = express.Router();
privateRouter.use(authMiddleware);

privateRouter.get("")
