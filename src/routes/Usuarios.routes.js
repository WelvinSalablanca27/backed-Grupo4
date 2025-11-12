import { Router } from 'express';
import { obtenerUsuarios, obtenerUsuario, registrarUsuario, eliminarUsuario, actualizarUsuarioPatch } from '../controllers/Usuarios.controllers.js';

const router = Router();

router.get('/Usuarios', obtenerUsuarios);

router.get ('/Usuario/:id',obtenerUsuario); 

// Ruta para registrar una nueva Categoría
router.post('/registrarUsuario', registrarUsuario);

router.delete('/eliminarUsuario/:id', eliminarUsuario);

// Ruta para actualizar una compras por su ID
router.patch('/actualizarUsuarioPatch/:id', actualizarUsuarioPatch);

// Rutas
export default router;