import express from 'express';
import cors from 'cors';

//Importar las rutas
import rutasCliente from './src/routes/Cliente.routes.js';
import rutasCompra from './src/routes/Compra.routes.js';
import rutasDetallesCompra from './src/routes/DetalleCompra.routes.js';
import rutasDetallesVentas from './src/routes/Detalles_venta.routes.js';
import rutasProductos from './src/routes/Producto.routes.js';
import rutasProveedor from './src/routes/Proveedor.routes.js';
import rutasVenta from './src/routes/Venta.routes.js';
import rutasUsuario from './src/routes/Usuario.routes.js';


// Crear la aplicación de Express
const app = express();

// Habilitar CORS para cualquier origen
app.use(cors({
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type'],
}));

// Middleware para parsear el cuerpo de las solicitudes
app.use(express.json({ limit: '10mb' })); //10 MB
app.use(express.urlencoded({ limit: '10mb', extended: true }));

// Rutas
app.use('/api', rutasCliente);
app.use('/api', rutasCompra);
app.use('/api', rutasDetallesCompra);
app.use('/api', rutasDetallesVentas);
app.use('/api', rutasProductos);
app.use('/api', rutasProveedor);
app.use('/api', rutasVenta);
app.use('/api', rutasUsuario);

// Manejo de rutas no encontradas
app.use((req, res, next) => {
  res.status(404).json({
    message: 'La ruta que ha especificado no se encuentra registrada.'
  });
});

// Exportar la aplicación
export default app;