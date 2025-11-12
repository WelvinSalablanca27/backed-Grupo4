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

<<<<<<< HEAD
// === RUTAS DE PRODUCTOS ===
router.get('/productos', obtenerProductos);
router.get('/producto/:id_Producto', obtenerProducto);
router.post('/registrarProducto', registrarProducto);        
router.patch('/actualizarProducto/:id_Producto', actualizarProducto);
router.delete('/eliminarProducto/:id_Producto', eliminarProducto); // 

=======
// Ruta para obtener todos los productos
router.get('/productos', obtenerProductos);

// Ruta para obtener un producto por su ID
router.get ('/Producto/:id_Producto',obtenerProducto); 

// Ruta para registrar una nueva Categoría
router.post('/registrarProducto', registrarProductos);

router.delete('/eliminarProducto/:id_Producto', eliminarProducto

);

// Ruta para actualizar una compras por su ID
router.patch('/actualizarProductoPatch/:id_Producto', actualizarProductoPatch);

// Rutas
>>>>>>> 3040a6fb4ba6bdba468806e86aa3f4383576cd0b
export default router;