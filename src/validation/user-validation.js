import Joi from "joi";

const registerValidation = Joi.object({
  nama_lengkap: Joi.string().max(70).required(),
  password: Joi.string().max(20).required(),
  email: Joi.string().max(255).required(),
});

const loginValidation = Joi.object({
  email: Joi.string().max(255).required(),
  password: Joi.string().max(20).required(),
});

export { registerValidation, loginValidation };
