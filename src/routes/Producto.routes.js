// routes/productos.js
import { Router } from 'express';
import {
  obtenerProductos,
  obtenerProducto,
  registrarProducto,
  actualizarProducto,
  eliminarProducto
} from '../controllers/Producto.controller.js';

const router = Router();

// === RUTAS DE PRODUCTOS ===
router.get('/productos', obtenerProductos);
router.get('/producto/:id_Producto', obtenerProducto);
router.post('/registrarProducto', registrarProducto);        
router.patch('/actualizarProducto/:id_Producto', actualizarProducto);
router.delete('/eliminarProducto/:id_Producto', eliminarProducto); // 

export default router;