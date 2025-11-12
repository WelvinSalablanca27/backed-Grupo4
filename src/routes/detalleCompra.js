import { Router } from "express";
import {
  obtenerDetallesCompra,
  obtenerDetalleCompra,
  registrarDetalleCompra,
  eliminarDetalleCompra,
  actualizarDetalleCompra
} from "../controllers/DetalleCompra.controllers.js";

const router = Router();

// Nota: las rutas aquí deben coincidir exactamente con lo que el front llama
router.get("/DetallesCompra", obtenerDetallesCompra);
router.get("/DetallesCompra/:id", obtenerDetalleCompra);
router.post("/registrarDetalleCompra", registrarDetalleCompra);
router.delete("/eliminarDetalleCompra/:id", eliminarDetalleCompra);
router.patch("/actualizarDetalleCompra/:id", actualizarDetalleCompra);

export default router;
