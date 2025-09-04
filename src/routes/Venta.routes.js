import { Router } from 'express';
import { obtenerVentas } from '../controllers/Venta.controller.js';

const router = Router();

router.get('/ventas', obtenerVentas);

// Rutas
export default router;