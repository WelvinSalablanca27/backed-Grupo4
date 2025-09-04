import { Router } from 'express';
import { obtenerClientes } from '../controllers/Cliente.controller.js';

const router = Router();

router.get('/clientes', obtenerClientes);

// Rutas
export default router;