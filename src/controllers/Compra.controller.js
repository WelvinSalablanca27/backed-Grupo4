import { pool } from '../../db_connection.js';

// Obtener todas las Compras
export const obtenerCompras = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Compra');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};


// Obtener una compra por su ID
export const obtenercompra = async (req, res) => {
  try {
    const id_compra = req.params.id_compra;
    const [result] = await pool.query('SELECT * FROM Compra WHERE id_compra= ?', [req.params.id_compra])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_compra} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las Compra.'
    });
  }
};


// Registrar una nueva Proveedor
export const registrarCompra = async (req, res) => {
  try {
    const { id_Proveedor, Fe_compra, total_compra } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Compra (id_Proveedor, Fe_compra, total_compra) VALUES  (?, ?, ?)',
      [ id_Proveedor, Fe_compra, total_compra ]
    );
    res.status(201).json({ id_compra: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la  Compra.',
      error: error
    });
  }
};


// Eliminar una Proveedor por su ID 
export const eliminarCompra = async (req, res) =>  {
  try {
    const id_compra = req.params.id_compra;
    const [result] = await pool.query('DELETE FROM Compra WHERE id_compra= ?', [id_compra]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar la Compra. ID ${id_compra} no fue encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `La Compra con ID ${id_compra} fue eliminada correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar la Compra.',
      error: error
    });
  }
};


// Controlador para actualizar parcialmente una Compra por su ID
export const actualizarCompraPatch = async (req, res) => {
  try {
    const { id_compra } = req.params;
    const datos = req.body;

    const [result] = await pool.query(
      'UPDATE Compra SET ? WHERE id_compra = ?',
      [datos, id_compra]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Compra con ID ${id_compra} no encontrada.`
      });
    }

    res.status(200).json({
      mensaje: `Compra con ID ${id_compra} actualizada.`
    });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al actualizar la Compra.', error });
  }
};
