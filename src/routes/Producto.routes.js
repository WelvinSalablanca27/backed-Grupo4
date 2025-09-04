import { Router } from 'express';
import { obtenerProductos } from '../controllers/Producto.controller.js';

const router = Router();

router.get('/productos', obtenerProductos);

// Rutas
export default router;