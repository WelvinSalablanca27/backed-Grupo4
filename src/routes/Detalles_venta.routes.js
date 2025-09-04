import { Router } from 'express';
import { obtenerDetallesVentas } from '../controllers/Detalles_venta.controller.js';

const router = Router();

router.get('/detallesventas', obtenerDetallesVentas);

// Rutas
export default router;