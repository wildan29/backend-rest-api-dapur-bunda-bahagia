import express from "express";
import userController from "../controller/user-controller.js";

const publicRoute = express.Router();

// User route
publicRoute.post("/api/users", userController.register);
publicRoute.post("/api/login", userController.login);

export { publicRoute };
