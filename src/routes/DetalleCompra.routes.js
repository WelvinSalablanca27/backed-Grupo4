import { Router } from 'express';
import { obtenerDetallesCompras, obtenerDetallesCompra, registrarDetalleCompra, eliminarDetalleCompra, actualizarDetalleCompraPatch } from '../controllers/DetalleCompra.controller.js';

const router = Router();

router.get('/detallescompras', obtenerDetallesCompras);

// Rutas
router.get('/detallescompras/:id_DetalleCompra', obtenerDetallesCompra);

// Rutas
router.post('/registrarDetalleCompra', registrarDetalleCompra);

//Rutas
router.delete('/eliminarDetalleCompra/:id_DetalleCompra', eliminarDetalleCompra);

// Ruta para actualizar una DetalleCompra por su ID
router.patch('/actualizarDetalleCompraPatch/:id_DetalleCompra', actualizarDetalleCompraPatch);

export default router;