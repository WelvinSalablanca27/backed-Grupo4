import { Router } from 'express';
import { obtenerVentas, obtenerVenta, registrarVenta, eliminarventa, actualizarVentas } from '../controllers/Venta.controller.js';

const router = Router();
// Rutas

router.get('/ventas', obtenerVentas);

// Rutas
router.get('/ventas/:id_Venta', obtenerVenta);

// Rutas
router.post('/registrarVenta', registrarVenta);

// Ruta para eliminar una venta por su ID
router.delete('/eliminarventas/:ID_venta', eliminarventa)

// Ruta para actualizar una venta por su ID
router.put('/actualizarventas/:ID_venta', actualizarVentas);


// Rutas
export default router;
