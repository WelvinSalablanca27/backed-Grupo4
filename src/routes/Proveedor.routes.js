
import { Router } from 'express';
import { obtenerProveedores, obtenerProveedor, registrarProveedor, eliminarProveedor, actualizarProveedorPatch } from '../controllers/Proveedor.controller.js';

const router = Router();
// Rutas
router.get('/Proveedores', obtenerProveedores);

// Rutas
router.get('/Proveedores/:id_Proveedor', obtenerProveedor);

// Rutas
router.post('/registrarProveedor', registrarProveedor);

//Rutas
router.delete('/eliminarProveedor/:id_Proveedor', eliminarProveedor);

// Ruta para actualizar una Proveedor por su ID
router.patch('/actualizarProveedorPatch/:id_Proveedor', actualizarProveedorPatch);


export default router;