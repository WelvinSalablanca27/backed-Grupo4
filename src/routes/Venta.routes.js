import { Router } from 'express';
import { obtenerVentas, obtenerVenta, registrarVenta, eliminarventas, actualizarVenta } from '../controllers/Venta.controller.js';

const router = Router();
// Rutas

router.get('/venta', obtenerVentas);

// Rutas
router.get('/ventas/:id_Venta', obtenerVenta);

// Rutas
router.post('/registrarVenta', registrarVenta);

// Ruta para eliminar una venta por su ID
router.delete('/eliminarventas/:id_venta', eliminarventas)

// Ruta para actualizar una venta por su ID
router.patch('/actualizarVenta/:id_venta', actualizarVenta);


// Rutas
export default router;
