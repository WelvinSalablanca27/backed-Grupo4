import { Router } from 'express';
import {
  obtenerProductos,
  obtenerProducto,
  registrarProducto,
  actualizarProducto,
  eliminarProducto
} from '../controllers/Producto.controllers.js';

const router = Router();


router.get('/producto', obtenerProductos);
router.get('/producto/:id_Producto', obtenerProducto);
router.post('/registrarProducto', registrarProducto);        
router.patch('/actualizarProducto/:id_Producto', actualizarProducto);
router.delete('/eliminarProducto/:id_Producto', eliminarProducto); // 


export default router;