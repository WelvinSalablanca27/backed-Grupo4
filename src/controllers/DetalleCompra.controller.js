import { pool } from '../../db_connection.js';

// Obtener todas las DetalleCompra
export const obtenerDetallesCompras = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM DetalleCompra');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};

// Obtener una Proveedor por su ID
export const obtenerDetallesCompra = async (req, res) => {
  try {
    const id_DetalleCompra = req.params.id_DetalleCompra;
    const [result] = await pool.query('SELECT * FROM DetalleCompra WHERE id_DetalleCompra= ?', [req.params.id_DetalleCompra])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_DetalleCompra} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las DetalleCompra.'
    });
  }
};



// Registrar una nueva DetalleCompra
export const registrarDetalleCompra = async (req, res) => {
  try {
    const { id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad } = req.body;
    const [result] = await pool.query(
      'INSERT INTO DetalleCompra (id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad) VALUES  (?, ?, ?, ?, ?, ?)',
      [ id_compra, id_Producto, Fe_Ingresado, Fe_caducidad, Precio, Cantidad ]
    );
    res.status(201).json({ id_DetalleCompra: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la  DetalleCompra.',
      error: error
    });
  }
};


// Eliminar una DetalleCompra por su ID 
export const eliminarDetalleCompra = async (req, res) =>  {
  try {
    const id_DetalleCompra = req.params.id_DetalleCompra;
    const [result] = await pool.query('DELETE FROM DetalleCompra WHERE id_DetalleCompra= ?', [id_DetalleCompra]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar la DetalleCompra. ID ${id_DetalleCompra} no fue encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `La DetalleCompra con ID ${id_DetalleCompra} fue eliminada correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar la DetalleCompra.',
      error: error
    });
  }
};


// Controlador para actualizar parcialmente una DetalleCompra por su ID
export const actualizarDetalleCompraPatch = async (req, res) => {
  try {
    const { id_DetalleCompra } = req.params;
    const datos = req.body;

    const [result] = await pool.query(
      'UPDATE DetalleCompra SET ? WHERE id_DetalleCompra = ?',
      [datos, id_DetalleCompra]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `DetalleCompra con ID ${id_DetalleCompra} no encontrada.`
      });
    }

    res.status(200).json({
      mensaje: `DetalleCompra con ID ${id_DetalleCompra} actualizada.`
    });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al actualizar la DetalleCompra.', error });
  }
};
