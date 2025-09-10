import { pool } from '../../db.connection.js';

// Obtener todos los Usuarios
export const obtenerUsuarios = async (req, res) => {
    try {
        const [result] = await pool.query('SELECT * FROM Usuario');
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
        const [result] = await pool.query('SELECT * FROM Usuario WHERE id= ?', [id]);
        if (result.length <= 0) {
            return res.status(404).json({
                mensaje: `Error al leer los datos. ID ${id} no encontrado.`
            });
        }
        res.json(result[0]);
    } catch (error) {
        return res.status(500).json({
            mensaje: 'Ha ocurrido un error al leer los datos de las categorias.'
        });
    }
};

// Registrar una nueva Categoría
export const registrarUsuario = async (req, res) => {
    try {
        const { nombre, apellido, correo_electronico, contrasena, telefono, genero, rol } = req.body;
        const [result] = await pool.query(
            'INSERT INTO Usuario (nombre, apellido, correo_electronico, contrasena, telefono, genero, rol) VALUES (?, ?, ?, ?, ?, ?, ?)',
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