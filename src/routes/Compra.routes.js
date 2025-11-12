import express from 'express';
import {
  obtenerCompras,
  obtenerCompra,
  registrarCompra,
  eliminarCompra,
  actualizarCompra
} from '../controllers/Compra.controllers.js';

const router = express.Router();

router.get('/compras', obtenerCompras);
router.get('/compras/:id_compra', obtenerCompra);
router.post('/registrarCompra', registrarCompra);
router.delete('/eliminarCompra/:id_compra', eliminarCompra);
router.patch('/actualizarCompra/:id_compra', actualizarCompra);

export default router;
