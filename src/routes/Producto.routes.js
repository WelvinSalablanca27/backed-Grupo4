import { Router } from 'express';
import { obtenerProductos, obtenerProducto, registrarProductos, eliminarProducto, actualizarProductoPatch  } from '../controllers/Producto.controller.js';

const router = Router();

router.get('/Productos', obtenerProductos);

router.get ('/Producto/:id_Producto',obtenerProducto); 

// Ruta para registrar una nueva Categoría
router.post('/registrarProducto', registrarProductos);

router.delete('/eliminarProducto/:id_Producto', eliminarProducto

);

// Ruta para actualizar una compras por su ID
router.patch('/actualizarProductoPatch/:id_Producto', actualizarProductoPatch);

// Rutas
export default router;