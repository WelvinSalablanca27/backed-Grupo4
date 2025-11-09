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
router.post('/registrarProducto', registrarProducto);        // ← singular
router.patch('/actualizarProducto/:id_Producto', actualizarProducto);
router.delete('/eliminarProducto/:id_Producto', eliminarProducto); // ← con :id_Producto

export default router;