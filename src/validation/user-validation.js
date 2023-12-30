import Joi from "joi";

const registerUserValidation = Joi.object({
  nama_lengkap: Joi.string().max(70).required(),
  password: Joi.string().max(20).required(),
  email: Joi.string().max(255).required(),
});

export { registerUserValidation };
