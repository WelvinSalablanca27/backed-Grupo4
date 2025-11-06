import { Router } from 'express';
import { obtenerCompras, obtenercompra, registrarCompra, eliminarCompra, actualizarCompra } from '../controllers/Compra.controller.js';

const router = Router();

router.get('/compras', obtenerCompras);

// Rutas
router.get('/compras/:id_compra', obtenercompra);

// Rutas
router.post('/registrarCompra', registrarCompra);

//Rutas
router.delete('/eliminarCompra/:id_compra', eliminarCompra);

// Ruta para actualizar una compras por su ID
router.patch('/actualizarCompra/:id_compra', actualizarCompra);


export default router;