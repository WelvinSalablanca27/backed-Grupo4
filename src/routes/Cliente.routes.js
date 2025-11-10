import { Router } from 'express';
import {
  obtenerClientes,
  obtenerCliente,
  registrarCliente,
  eliminarCliente,
  actualizarCliente
} from '../controllers/Cliente.controller.js'; // ajusta la ruta según tu estructura

const router = Router();

// Rutas de clientes

router.get('/clientes', obtenerClientes);
router.get('/clientes/:id_Cliente', obtenerCliente);
router.post('/registrarCliente', registrarCliente);
router.delete('/eliminarCliente/:id_Cliente', eliminarCliente);
router.patch('/actualizarCliente/:id_Cliente', actualizarCliente);

export default router;
