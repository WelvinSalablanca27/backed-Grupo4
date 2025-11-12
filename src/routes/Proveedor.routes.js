import { Router } from "express";
import { obtenerProveedores, obtenerProveedor, registrarProveedor, eliminarProveedor, actualizarProveedor } from "../controllers/Proveedor.controller.js";

const router = Router();
<<<<<<< HEAD
=======
// Ruta para obtener todos los proveedores
router.get('/proveedores', obtenerProveedores);
>>>>>>> 3040a6fb4ba6bdba468806e86aa3f4383576cd0b

router.get('/proveedores', obtenerProveedores);
router.get('/proveedor/:id_Proveedor', obtenerProveedor);
router.post('/registrarproveedor', registrarProveedor);
router.delete('/eliminarproveedor/:id_Proveedor', eliminarProveedor);
router.patch('/actualizarproveedor/:id_Proveedor', actualizarProveedor);

export default router;
