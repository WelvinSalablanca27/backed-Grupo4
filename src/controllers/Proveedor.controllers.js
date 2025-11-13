import { pool } from '../../db_connection.js';

// Obtener todos los Proveedores
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

// Obtener un Proveedor por su ID
export const obtenerProveedor = async (req, res) => {
  try {
    const id_Proveedor = req.params.id_Proveedor;
    const [result] = await pool.query(
      'SELECT * FROM Proveedor WHERE id_Proveedor = ?',
      [id_Proveedor]
    );

    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Proveedor con ID ${id_Proveedor} no encontrado.`
      });
    }

    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos del proveedor.',
      error
    });
  }
};

// Registrar un nuevo Proveedor
export const registrarProveedor = async (req, res) => {
  try {
    const { Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago } = req.body;
    
    const [result] = await pool.query(
      `INSERT INTO Proveedor 
      (Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago)
      VALUES (?, ?, ?, ?, ?, ?)`,
      [Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago]
    );

    res.status(201).json({ id_Proveedor: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar el proveedor.',
      error
    });
  }
};

// Eliminar un Proveedor por su ID
export const eliminarProveedor = async (req, res) => {
  try {
    const id_Proveedor = req.params.id_Proveedor;

    const [result] = await pool.query(
      'DELETE FROM Proveedor WHERE id_Proveedor = ?',
      [id_Proveedor]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Proveedor con ID ${id_Proveedor} no encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `Proveedor con ID ${id_Proveedor} eliminado correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar el proveedor.',
      error
    });
  }
};

// Actualizar un Proveedor por su ID
export const actualizarProveedor = async (req, res) => {
  try {
    const { id_Proveedor } = req.params;
    const { Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago, Estado } = req.body;

    const [result] = await pool.query(
      `UPDATE Proveedor
       SET Nombre_Proveedor = ?, Telefono = ?, Email = ?, Direccion = ?, 
           Tipo_Distribuidor = ?, Condiciones_Pago = ?, Estado = ?
       WHERE id_Proveedor = ?`,
      [Nombre_Proveedor, Telefono, Email, Direccion, Tipo_Distribuidor, Condiciones_Pago, Estado, id_Proveedor]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Proveedor con ID ${id_Proveedor} no encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `Proveedor con ID ${id_Proveedor} actualizado correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Error al actualizar el proveedor.',
      error
    });
  }
};
