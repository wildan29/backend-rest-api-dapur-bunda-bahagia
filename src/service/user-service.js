import { prismaClient } from "../application/database.js";
import { ResponseError } from "../error/response-error.js";
import {
  loginValidation,
  registerValidation,
} from "../validation/user-validation.js";
import { validate } from "../validation/validation.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

const register = async (request) => {
  request = validate(registerValidation, request);

  // Check whether email has been registered or not
  const countUser = await prismaClient.user.count({
    where: {
      email: request.email,
    },
  });

  // if email is already registerd then throw error
  if (countUser === 1) {
    throw new ResponseError(400, "Email Already registered");
  }

  // Hash password using bcrypt
  request.password = await bcrypt.hash(request.password, 10);

  await prismaClient.user.create({
    data: request,
  });

  return {
    message: "Account created successfully",
  };
};

const login = async (request) => {
  request = validate(loginValidation, request);

  // cek if users is exsit or no
  const user = await prismaClient.user.findFirst({
    where: {
      email: request.email,
    },
    select: {
      password: true,
      id: true,
    },
  });

  if (!user) {
    throw new ResponseError(402, "Username or password wrong");
  }

  // check password with bcyrpt
  const isPasswordValid = await bcrypt.compare(request.password, user.password);

  // if validation password failed
  if (!isPasswordValid) {
    throw new ResponseError(401, "Username or password wrong");
  }

  // create token with uuid
  const token = uuid().toString();

  return prismaClient.user.update({
    data: {
      token: token,
    },
    where: {
      id: user.id,
    },
    select: {
      token: true,
      role: true,
    },
  });
};

export default {
  register,
  login,
};
