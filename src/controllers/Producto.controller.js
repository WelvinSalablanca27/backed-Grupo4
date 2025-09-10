import { pool } from '../../db_connection.js';

// Obtener todas las Producto
export const obtenerProductos = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Producto');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};

// Obtener una Producto por su ID
export const obtenerProducto = async (req, res) => {
    try {
        const id_Producto = req.params.id_Producto;
        const [result] = await pool.query('SELECT * FROM Producto WHERE id_Producto= ?', [id_Producto]);
        if (result.length <= 0) {
            return res.status(404).json({
                mensaje: `Error al leer los datos. id_Producto ${id_Producto} no encontrado.`
            });
        }
        res.json(result[0]);
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al leer los datos del Producto.'
        });
    }
};

// Registrar una nueva Categoría
export const registrarProductos = async (req, res) => {
    try {
        const { Nombre_Prod,Tipo_Prod,Existencia_Prod,Precio_Costo,Precio_Venta,Fe_caducidad } = req.body;
        const [result] = await pool.query(
            'INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta, Fe_caducidad) VALUES (?, ?, ?, ?, ?, ?)',
            [Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta, Fe_caducidad]
        );
        res.status(201).json({ id_Producto: result.insertId });
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al registrar al Usuario.',
            error: error
        });
    }
};