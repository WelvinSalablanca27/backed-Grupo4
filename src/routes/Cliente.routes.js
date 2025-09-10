import { Router } from 'express';
import { obtenerClientes, obtenerCliente, registrarCliente} from '../controllers/Cliente.controller.js';

const router = Router();

router.get('/clientes', obtenerClientes);

router.get('/cliente/:id_Cliente', obtenerCliente);

//ruta 
router.post('/registrarcliente', registrarCliente);


//Rutas
export default router;
