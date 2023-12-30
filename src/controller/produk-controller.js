import produkService from "../service/produk-service.js";

const getAll = async (req, res, next) => {
  try {
    const id_user = req.user.id;
    const kategori = req.query.kategori;
    const result = await produkService.getAll(id_user, kategori);
    res.status(200).json({ data: result });
  } catch (error) {
    next(error);
  }
};

export default {
  getAll,
};
