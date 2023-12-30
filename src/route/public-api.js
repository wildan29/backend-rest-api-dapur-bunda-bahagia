import express from "express";
import userController from "../controller/user-controller.js";

const publicRoute = express.Router();

// User route
publicRoute.post("/api/users", userController.register);

export { publicRoute };
