import { Router } from 'express';
import { obtenerDetallesCompras } from '../controllers/DetalleCompra.controller.js';

const router = Router();

router.get('/detallescompras', obtenerDetallesCompras);

// Rutas
export default router;