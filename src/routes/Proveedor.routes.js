import { Router } from 'express';
import { obtenerProveedores, obtenerProveedor, registrarProveedor, eliminarProveedor} from '../controllers/Proveedor.controller.js';

const router = Router();
// Rutas
router.get('/Proveedores', obtenerProveedores);

// Rutas
router.get('/Proveedores/:id_Proveedor', obtenerProveedor);

// Rutas
router.post('/registrarProveedor', registrarProveedor);

//Rutas
router.delete('/eliminarProveedor/:id_Proveedor', eliminarProveedor);
export default router;