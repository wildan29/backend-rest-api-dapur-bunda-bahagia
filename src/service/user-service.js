import { prismaClient } from "../application/database.js";
import { ResponseError } from "../error/response-error.js";
import { registerUserValidation } from "../validation/user-validation.js";
import { validate } from "../validation/validation.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

const register = async (request) => {
  request = validate(registerUserValidation, request);

  // Check whether email has been registered or not
  const countUser = await prismaClient.user.count({
    where: {
      email: request.email,
    },
  });

  // if email is already registerd then throw error
  if (countUser === 1) {
    throw new ResponseError(400, "Email Already Exists");
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

export default {
  register,
};
