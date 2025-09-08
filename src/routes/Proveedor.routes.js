import { Router } from 'express';
import { obtenerProveedores } from '../controllers/Proveedor.controller.js';

const router = Router();

router.get('/Proveedores', obtenerProveedores);

// Rutas
export default router;