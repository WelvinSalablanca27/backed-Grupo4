import { pool } from '../../db_connection.js';

// Obtener todas las Cliente
export const obtenerClientes = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Cliente');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};


// Obtener una Cliente por su ID
export const obtenerCliente = async (req, res) => {
  try {
    const id_Cliente = req.params.id_Cliente;
    const [result] = await pool.query('SELECT * FROM Cliente WHERE id_Cliente= ?', [req.params.id_Cliente])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_Cliente} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las Cliente.'
    });
  }
};



// Registrar un nuevo Cliente
export const registrarCliente = async (req, res) => {
  try {
    const { Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Cliente (Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono) VALUES (?, ?, ?, ?, ?, ?)',
      [ Nombre1, Nombre2, Apellido1, Apellido2, Direccion, Telefono ]
    );
    res.status(201).json({ id_Cliente: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la Cliente.',
      error: error
    });
  }
};

// Eliminar una Cliente por su ID 
export const eliminarCliente = async (req, res) =>  {
  try {
    const id_Cliente = req.params.id_Cliente;
    const [result] = await pool.query('DELETE FROM Cliente WHERE id_Cliente= ?', [id_Cliente]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar la Cliente. ID ${id_Cliente} no fue encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `La Cliente con ID ${id_Cliente} fue eliminada correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar la Cliente.',
      error: error
    });
  }
};


// Controlador para actualizar parcialmente una Cliente por su ID
export const actualizarClientePatch = async (req, res) => {
  try {
    const { id_Cliente } = req.params;
    const datos = req.body;

    const [result] = await pool.query(
      'UPDATE Cliente SET ? WHERE id_Cliente = ?',
      [datos, id_Cliente]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Cliente con ID ${id_Cliente} no encontrada.`
      });
    }

    res.status(200).json({
      mensaje: `Cliente con ID ${id_Cliente} actualizada.`
    });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al actualizar la Cliente.', error });
  }
};

