// Setup Express

import express from "express";
import { publicRoute } from "../route/public-api.js";
import { errorMiddleware } from "../middleware/error-middleware.js"; 
import { privateRouter } from "../route/private-api.js";
export const web = express();

web.use(express.json());
web.use(express.urlencoded({ extended: true }));
web.use(publicRoute);
web.use(privateRouter);
web.use(errorMiddleware);
