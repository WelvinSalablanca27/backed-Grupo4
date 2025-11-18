import { Router } from 'express';
import { ObtenerVentas, obtenerVenta, registrarVenta, eliminarventas, actualizarVenta } from '../controllers/Venta.controllers.js';

const router = Router();
// Rutas

router.get('/ventas', ObtenerVentas);

// Rutas
router.get('/ventas/:id_Ventas', obtenerVenta);

// Rutas
router.post('/registrarVenta', registrarVenta);

// Ruta para eliminar una venta por su ID
router.delete('/eliminarventas/:id_venta', eliminarventas)

// Ruta para actualizar una venta por su ID
router.patch('/actualizarVenta/:id_venta', actualizarVenta);


// Rutas
export default router;
