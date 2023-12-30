import { userValidation } from "../validation/produk-validation.js";
import { validate } from "../validation/validation.js";
import { prismaClient } from "../application/database.js";
import { ResponseError } from "../error/response-error.js";

const getAll = async (id_user) => {
  id_user = validate(userValidation, id_user);

  const user = await prismaClient.user.findUnique({
    where: {
      id: id_user,
    },
  });

  if (!user) {
    throw new ResponseError(404, "user is not found");
  }

  return prismaClient.produk.findMany({});
};

export default {
  getAll,
};
