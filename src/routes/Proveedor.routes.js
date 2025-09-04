import { Router } from 'express';
import { obtenerEmpleados } from '../controllers/Proveedor.controller.js';

const router = Router();

router.get('/empleados', obtenerEmpleados);

// Rutas
export default router;