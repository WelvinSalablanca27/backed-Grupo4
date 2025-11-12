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

 // Actualizar una Venta
export const actualizarDetalles_venta = async (req, res) => {
  try {
    const id_DetalleVenta = req.params.id_DetalleVenta;
    const { id_Venta, id_Producto, Precio_venta, Cantidad_Producto } = req.body;

    const [result] = await pool.query(
      'UPDATE venta SET id_venta = ?, id_Producto = ?, Precio_venta = ?, cantidad_Producto = ? WHERE id_ventas = ?',
      [id_Venta, id_Producto, Precio_venta, Cantidad_Producto]  
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: 'Error al actualizar. ID ${id_DetalleVenta} no encontrado.'
      });
    }

    res.json({
      mensaje:' Venta con ID ${id_DetalleVenta} actualizada correctamente.'
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al actualizar el Detalle_venta.',
      error: error
    });
  }
};

