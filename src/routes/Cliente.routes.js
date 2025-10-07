import { Router } from 'express';
import { obtenerClientes, obtenerCliente, registrarCliente, eliminarCliente, actualizarClientePatch} from '../controllers/Cliente.controller.js';

const router = Router();

router.get('/clientes', obtenerClientes);

router.get('/cliente/:id_Cliente', obtenerCliente);

//ruta 
router.post('/registrarcliente', registrarCliente);


//Rutas
router.delete('/eliminarCliente/:id_Cliente', eliminarCliente);

// Ruta para actualizar una Cliente por su ID
router.patch('/actualizarClientePatch/:id_Cliente', actualizarClientePatch);


export default router;

