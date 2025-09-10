import { Router } from 'express';
import { obtenerProductos, obtenerProducto, registrarProductos } from '../controllers/Producto.controller.js';

const router = Router();

router.get('/Productos', obtenerProductos);

router.get ('/Producto/:id_Producto',obtenerProducto); 

// Ruta para registrar una nueva Categoría
router.post('/registrarProducto', registrarProductos);

// Rutas
export default router;