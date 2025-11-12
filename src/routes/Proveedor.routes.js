import { Router } from "express";
import { obtenerProveedores, obtenerProveedor, registrarProveedor, eliminarProveedor, actualizarProveedor } from "../controllers/Proveedor.controllers.js";

const router = Router();
router.get('/proveedores', obtenerProveedores);
router.get('/proveedor/:id_Proveedor', obtenerProveedor);
router.post('/registrarproveedor', registrarProveedor);
router.delete('/eliminarproveedor/:id_Proveedor', eliminarProveedor);
router.patch('/actualizarproveedor/:id_Proveedor', actualizarProveedor);

export default router;
