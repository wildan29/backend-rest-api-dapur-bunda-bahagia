import Joi from "joi";

const userValidation = Joi.number().min(1).required();

const getAllValidation = Joi.number().min(1).default(1)
export { userValidation, getAllValidation };
