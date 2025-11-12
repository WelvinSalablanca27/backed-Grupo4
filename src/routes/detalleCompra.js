import { Router } from "express";
import {
  obtenerDetallesCompra,
  obtenerDetalleCompra,
  registrarDetalleCompra,
  eliminarDetalleCompra,
  actualizarDetalleCompra
} from "../controllers/DetalleCompra.controller.js";

const router = Router();

router.get('/DetallesCompra', obtenerDetallesCompra);
router.get('/DetallesCompra/:id', obtenerDetalleCompra);
router.post('/registrarDetalleCompra', registrarDetalleCompra);
router.delete('/eliminarDetalleCompra/:id', eliminarDetalleCompra);
router.patch('/actualizarDetalleCompra/:id', actualizarDetalleCompra);

export default router;
