import { Router } from 'express';
import { obtenerVentas, obtenerVenta, registrarVenta } from '../controllers/Venta.controller.js';

const router = Router();
// Rutas

router.get('/ventas', obtenerVentas);

// Rutas
router.get('/ventas/:id_Venta', obtenerVenta);

// Rutas
router.post('/registrarVenta', registrarVenta);
// Rutas
export default router;