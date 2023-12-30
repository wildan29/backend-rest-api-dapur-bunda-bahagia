import Joi from "joi";

const userValidation = Joi.number().min(1).required();

export { userValidation };
