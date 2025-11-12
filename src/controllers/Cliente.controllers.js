import { pool } from '../../db_connection.js';

/**
 * ✅ Obtener todos los clientes
 */
export const obtenerClientes = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Cliente');
    res.status(200).json(result);
  } catch (error) {
    console.error('Error al obtener clientes:', error);
    res.status(500).json({
      mensaje: 'Error al leer los datos de clientes.',
      error: error.message
    });
  }
};

/**
 * ✅ Obtener un cliente por su ID
 */
export const obtenerCliente = async (req, res) => {
  const { id_Cliente } = req.params;

  try {
    const [result] = await pool.query(
      'SELECT * FROM Cliente WHERE id_Cliente = ?',
      [id_Cliente]
    );

    if (result.length === 0) {
      return res.status(404).json({
        mensaje: `No se encontró el cliente con ID ${id_Cliente}.`
      });
    }

    res.status(200).json(result[0]);
  } catch (error) {
    console.error('❌ Error al obtener cliente:', error);
    res.status(500).json({
      mensaje: 'Error al leer los datos del cliente.',
      error: error.message
    });
  }
};

/**
 * ✅ Registrar un nuevo cliente
 */
export const registrarCliente = async (req, res) => {
  try {
    const { Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono } = req.body;

    // Validación básica
    if (!Nombre1 || !Apellido1) {
      return res.status(400).json({
        mensaje: 'Nombre1 y Apellido1 son campos obligatorios.'
      });
    }

    const [result] = await pool.query(
      `INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono]
    );

    res.status(201).json({
      mensaje: 'Cliente registrado exitosamente.',
      id_Cliente: result.insertId
    });
  } catch (error) {
    console.error('Error al registrar cliente:', error);
    res.status(500).json({
      mensaje: 'Error al registrar el cliente.',
      error: error.message
    });
  }
};

/**
 * ✅ Actualizar parcialmente un cliente
 */
export const actualizarCliente = async (req, res) => {
  const { id_Cliente } = req.params;
  const datos = req.body;

  try {
    const [result] = await pool.query(
      'UPDATE Cliente SET ? WHERE id_Cliente = ?',
      [datos, id_Cliente]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `No se encontró el cliente con ID ${id_Cliente}.`
      });
    }

    res.status(200).json({
      mensaje: `Cliente con ID ${id_Cliente} actualizado correctamente.`
    });
  } catch (error) {
    console.error(' Error al actualizar cliente:', error);
    res.status(500).json({
      mensaje: 'Error al actualizar el cliente.',
      error: error.message
    });
  }
};

/**
 * ✅ Eliminar un cliente por ID
 */
export const eliminarCliente = async (req, res) => {
  const { id_Cliente } = req.params;

  try {
    const [result] = await pool.query(
      'DELETE FROM Cliente WHERE id_Cliente = ?',
      [id_Cliente]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `No se encontró el cliente con ID ${id_Cliente}.`
      });
    }

    res.status(200).json({
      mensaje: `Cliente con ID ${id_Cliente} eliminado correctamente.`
    });
  } catch (error) {
    console.error(' Error al eliminar cliente:', error);
    res.status(500).json({
      mensaje: 'Error al eliminar el cliente.',
      error: error.message
    });
  }
};
