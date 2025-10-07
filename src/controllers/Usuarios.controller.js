import { pool } from '../../db_connection.js';

// Obtener todos los Usuarios
export const obtenerUsuarios = async (req, res) => {
    try {
        const [result] = await pool.query('SELECT * FROM Usuarios');
        res.json(result);
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al leer los datos.',
            error: error
        });
    }
};

// Obtener una usuario por su ID
export const obtenerUsuario = async (req, res) => {
    try {
        const id = req.params.id;
        const [result] = await pool.query('SELECT * FROM Usuarios WHERE id= ?', [id]);
        if (result.length <= 0) {
            return res.status(404).json({
                mensaje: `Error al leer los datos. ID ${id} no encontrado.`
            });
        }
        res.json(result[0]);
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al leer los datos de las Usuarios.'
        });
    }
};

// Registrar una nueva Categoría
export const registrarUsuario = async (req, res) => {
    try {
        const { nombre, apellido, correo_electronico, contrasena, telefono, genero, rol } = req.body;
        const [result] = await pool.query(
            'INSERT INTO Usuarios (nombre, apellido, correo_electronico, contrasena, telefono, genero, rol) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [nombre, apellido, correo_electronico, contrasena, telefono, genero, rol]
        );
        res.status(201).json({ id: result.insertId });
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al registrar al Usuario.',
            error: error
        });
    }
};

export const eliminarUsuario = async (req, res) =>  {
  try {
    const id = req.params.id;
    const [result] = await pool.query('DELETE FROM Usuarios WHERE id= ?', [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Error al eliminar el Usuario. ID ${id} no fue encontrado.`
      });
    }

    res.status(200).json({
      mensaje: `El Usuario con ID ${id} fue eliminada correctamente.`
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al eliminar el Usuario.',
      error: error
    });
  }
};


export const actualizarUsuarioPatch = async (req, res) => {
  try {
    const { id } = req.params;
    const datos = req.body;

    const [result] = await pool.query(
      'UPDATE Usuarios SET ? WHERE id = ?',
      [datos, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Usuario con ID ${id} no encontrada.`
      });
    }

    res.status(200).json({
      mensaje: `Usuario con ID ${id} actualizada.`
    });
  } catch (error) {
    res.status(500).json({ mensaje: 'Error al actualizar los Usuarios.', error });
  }
};
