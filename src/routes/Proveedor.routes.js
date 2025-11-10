
import { Router } from 'express';
import { obtenerProveedores, obtenerProveedor, registrarProveedor, eliminarProveedor, actualizarProveedorPatch } from '../controllers/Proveedor.controller.js';

const router = Router();
// Ruta para obtener todos los proveedores
router.get('/proveedores', obtenerProveedores);

router.get('/proveedor/:id_Proveedor', obtenerProveedor);

// Ruta para registrarProveedor una Proveedor 
router.post('/registrarProveedor', registrarProveedor);

// Ruta para eliminarProveedor una Proveedor por su ID 
router.delete('/eliminarProveedor/:id_Proveedor', eliminarProveedor);

// Ruta para actualizar una Proveedor por su ID 
router.patch('/actualizarProveedorPatch/:id_Proveedor', actualizarProveedorPatch);



export default router;