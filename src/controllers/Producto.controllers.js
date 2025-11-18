import { pool } from '../../db_connection.js';

export const obtenerProductos = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Producto');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error.message
    });
  }
};

export const obtenerProducto = async (req, res) => {
  try {
    const id_Producto = req.params.id_Producto;
    const [result] = await pool.query('SELECT * FROM Producto WHERE id_Producto = ?', [id_Producto]);

    if (result.length === 0) {
      return res.status(404).json({
        mensaje: `Producto con ID ${id_Producto} no encontrado.`
      });
    }

    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Error al obtener el producto.',
      error: error.message
    });
  }
};

export const registrarProducto = async (req, res) => {
  try {
    const {
      Nombre_Prod,
      Tipo_Prod,
      Existencia_Prod,
      Precio_Costo,
      Precio_Venta,
      Fe_caducidad
    } = req.body;

    const [result] = await pool.query(
      'INSERT INTO Producto (Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta, Fe_caducidad) VALUES (?, ?, ?, ?, ?, ?)',
      [Nombre_Prod, Tipo_Prod, Existencia_Prod, Precio_Costo, Precio_Venta, Fe_caducidad]
    );

    res.status(201).json({
      mensaje: 'Producto registrado correctamente.',
      id_Producto: result.insertId
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Error al registrar el producto.',
      error: error.message
    });
  }
};

export const eliminarProducto = async (req, res) => {
  try {
    const id_Producto = req.params.id_Producto;
    const [result] = await pool.query('DELETE FROM Producto WHERE id_Producto = ?', [id_Producto]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Producto con ID ${id_Producto} no encontrado.`
      });
    }

    res.json({
      mensaje: `Producto con ID ${id_Producto} eliminado correctamente.`
    });
  } catch (error) {
    console.error('Error en eliminarProducto:', error);
    return res.status(500).json({
      mensaje: 'Error al eliminar el producto.',
      error: error.message
    });
  }
};

export const actualizarProducto = async (req, res) => {
  try {
    const id_Producto = req.params.id_Producto;
    let {
      Nombre_Prod,
      Tipo_Prod,
      Existencia_Prod,
      Precio_Costo,
      Precio_Venta,
      Fe_caducidad
    } = req.body;

    const campos = {};

    if (Nombre_Prod) campos.Nombre_Prod = Nombre_Prod;
    if (Tipo_Prod) campos.Tipo_Prod = Tipo_Prod;
    if (Existencia_Prod !== undefined) campos.Existencia_Prod = Number(Existencia_Prod);
    if (Precio_Costo !== undefined) campos.Precio_Costo = Number(Precio_Costo);
    if (Precio_Venta !== undefined) campos.Precio_Venta = Number(Precio_Venta);

    if (Fe_caducidad) {
      const fecha = new Date(Fe_caducidad);
      if (isNaN(fecha.getTime())) {
        return res.status(400).json({ mensaje: 'Fecha de caducidad inválida.' });
      }
      const yyyy = fecha.getFullYear();
      const mm = String(fecha.getMonth() + 1).padStart(2, '0');
      const dd = String(fecha.getDate()).padStart(2, '0');
      campos.Fe_caducidad = `${yyyy}-${mm}-${dd}`;
    }

    if (Object.keys(campos).length === 0) {
      return res.status(400).json({ mensaje: 'Debe enviar al menos un campo para actualizar.' });
    }

    const [result] = await pool.query('UPDATE Producto SET ? WHERE id_Producto = ?', [campos, id_Producto]);

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `Producto con ID ${id_Producto} no encontrado.`
      });
    }

    res.json({
      mensaje: `Producto con ID ${id_Producto} actualizado correctamente.`
    });
  } catch (error) {
    console.error('Error en actualizarProducto:', error);
    res.status(500).json({
      mensaje: 'Error al actualizar el producto.',
      error: error.message
    });
  }
};
