import { Router } from 'express';
import { obtenerProductos,obtenerProducto,registrarProducto } from '../controllers/Producto.controller.js';

const router = Router();

router.get('/Productos', obtenerProductos);

router.get ('/Producto/:id',obtenerProducto); 

// Ruta para registrar una nueva Categoría
router.post('/registrarProducto', registrarProducto);

// Rutas
export default router;