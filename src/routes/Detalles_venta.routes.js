import { Router } from 'express';
import { obtenerDetallesVentas, obtenerDetalleVenta, registrarDetalleVenta} from '../controllers/Detalles_venta.controller.js';

const router = Router();
// Rutas
router.get('/detallesventas', obtenerDetallesVentas);
// Rutas
router.get('/detallesventas/:id_DetalleVenta', obtenerDetalleVenta);

// Rutas
router.post('/registrarDetalleVenta', registrarDetalleVenta);

export default router;