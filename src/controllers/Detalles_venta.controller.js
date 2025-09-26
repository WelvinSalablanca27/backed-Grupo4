import { pool } from '../../db_connection.js';

// Obtener todas las Detalles_venta
export const obtenerDetallesVentas = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Detalles_venta');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};

// Obtener una obtenerDetalleVenta por su ID
export const obtenerDetalleVenta= async (req, res) => {
  try {
    const id_DetalleVenta = req.params.id_DetalleVenta;
    const [result] = await pool.query('SELECT * FROM Detalles_venta WHERE id_DetalleVenta= ?', [req.params.id_DetalleVenta])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_DetalleVenta} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las DetalleVenta.'
    });
  }
};


// Registrar una nueva registrarDetalleVenta
export const registrarDetalleVenta = async (req, res) => {
  try {
    const { id_Venta, id_Producto, Precio_venta, Cantidad_Producto } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Detalles_venta(id_Venta, id_Producto, Precio_venta, Cantidad_Producto) VALUES  (?, ?, ?, ?)',
      [ id_Venta, id_Producto, Precio_venta, Cantidad_Producto ]
    );
    res.status(201).json({ id_DetalleVenta: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la DetalleVenta.',
      error: error
    });
  }
};

// Eliminar una venta por su ID
export const eliminarDetalleventas = async (req, res) => {
  try {
    const id_Detalleventas = req.params.id_Detalleventas;
    const [result] = await pool.query('DELETE FROM ventas WHERE id_DetalleVenta = ?', [id_DetalleVenta]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        mensaje: 'Error al eliminar la DetalleVenta. El ID ${id_DetalleVenta} no fue encontrada'
       });
      }

  // Respuestas sin contenido para indicar exito
   res.status(204).sed();
    }catch (error) {
      return res.status(500).json({
        mensaje: 'Ha ocurrido un error al eliminar un DetalleVenta.',
        error: error
      });
    }
  }

  // Actualizar una venta por su ID
export const actualizarDetalleventas = async (req, res) => {
  try {
    const id_DetalleVenta = req.params.id;
    const { producto, cantidad, precio } = req.body;

    if (!producto || !cantidad || !precio) {
      return res.status(400).json({ mensaje: 'Todos los campos son obligatorios.' });
    }

    const [result] = await pool.query(
      'UPDATE ventas SET producto = ?, cantidad = ?, precio = ? WHERE id_DetalleVenta = ?',
      [producto, cantidad, precio, id_DetalleVenta]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        mensaje: `No se encontró DetalleVenta con ID ${id_DetalleVenta}`
      });
    }

    res.status(200).json({ mensaje: 'DetalleVenta actualizada correctamente.' });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al actualizar el DetalleVenta.',
      error: error.message
    });
  }
}
