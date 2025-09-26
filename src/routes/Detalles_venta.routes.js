import { Router } from 'express';
import { obtenerDetallesVentas, obtenerDetalleVenta, registrarDetalleVenta, eliminarDetalleventas, actualizarDetalleventas} from '../controllers/Detalles_venta.controller.js';

const router = Router();
// Rutas
router.get('/detallesventas', obtenerDetallesVentas);
// Rutas
router.get('/detallesventas/:id_DetalleVenta', obtenerDetalleVenta);

// Rutas
router.post('/registrarDetalleVenta', registrarDetalleVenta);

// Ruta para eliminar una Detalleventas por su ID
router.delete('/eliminarDetalleventas/:ID_venta', eliminarDetalleventas)

// Ruta para actualizar un detalle de venta por su ID
router.put('/actualizardetalleventas/:id_DetalleVenta', actualizarDetalleventas);

export default router;