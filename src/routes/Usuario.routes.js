import { Router } from 'express';
import { obtenerUsuarios, obtenerUsuario, registrarUsuario} from '../controllers/Usuario.controller.js';

const router = Router();

router.get('/Usuario', obtenerUsuarios);

router.get ('/Usuario/:id',obtenerUsuario); 

// Ruta para registrar una nueva Categoría
router.post('/registrarUsuario', registrarUsuario);

// Rutas
export default router;