import { Router } from 'express';
import { obtenerCompras } from '../controllers/Compra.controller.js';

const router = Router();

router.get('/compras', obtenerCompras);

// Rutas
export default router;