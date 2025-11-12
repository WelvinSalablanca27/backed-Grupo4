import { pool } from '../../db_connection.js';

// Obtener todas las Proveedor
export const obtenerProveedores = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Proveedor');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};

// Obtener una Proveedor por su ID
export const obtenerProveedor = async (req, res) => {
  try {
    const id_Proveedor = req.params.id_Proveedor;
    const [result] = await pool.query('SELECT * FROM Proveedor WHERE id_Proveedor= ?', [req.params.id_Proveedor])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_Proveedor} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las Proveedor.'
    });
  }
};


// Registrar una nueva Proveedor
export const registrarProveedor = async (req, res) => {
  try {
    const { Nombre_Proveedor, Telefono, Tipo_distribuidor } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Tipo_distribuidor) VALUES  (?, ?, ?)',
      [ Nombre_Proveedor, Telefono, Tipo_distribuidor ]
    );
    res.status(201).json({ id_Proveedor: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la  Proveedor.',
      error: error
    });
  }
};


// Eliminar una Proveedor por su ID 
export const eliminarProveedor = async (req, res) =>  {
  try {
    const id_Proveedor = req.params.id_Proveedor;
    const [result] = await pool.query('DELETE FROM Proveedor WHERE id_Proveedor= ?', [id_Proveedor]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar la Proveedor. ID ${id_Proveedor} no fue encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `La Proveedor con ID ${id_Proveedor} fue eliminada correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar la Proveedor.',
      error: error
    });
  }
};


// Controlador para actualizar parcialmente una Proveedor por su ID
export const actualizarProveedor = async (req, res) => {
  try {
    const { id_Proveedor } = req.params;
    const datos = req.body;

    const [result] = await pool.query(
      'UPDATE Proveedor SET ? WHERE id_Proveedor = ?',
      [datos, id_Proveedor]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Proveedor con ID ${id_Proveedor} no encontrada.`
      });
    }

    res.status(200).json({
      mensaje: `Proveedor con ID ${id_Proveedor} actualizada.`
    });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al actualizar la Proveedor.', error });
  }
};
