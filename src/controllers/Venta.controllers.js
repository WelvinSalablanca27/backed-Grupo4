import { pool } from '../../db_connection.js';

// Obtener todas las Ventas
export const ObtenerVentas = async (req, res) => {
  try {
    const [result] = await pool.query('SELECT * FROM Venta');
    res.json(result);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos.',
      error: error
    });
  }
};


// Obtener una Venta por su ID
export const obtenerVenta = async (req, res) => {
  try {
    const id_ventas = req.params.id_ventas;
    const [result] = await pool.query('SELECT * FROM Venta WHERE id_ventas= ?', [req.params.id_ventas])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_ventas} no encontrado.`
      });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al leer los datos de las Ventas.'
    });
  }
};



// Registrar una nueva registrarVenta
export const registrarVenta = async (req, res) => {
  try {
    const { id_Cliente, Fe_Venta } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Venta (id_Cliente, Fe_Venta) VALUES  (?, ?, ?)',
      [ id_Cliente, Fe_Venta ]
    );
    res.status(201).json({ id_ventas: result.insertId });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al registrar la  ventas.',
      error: error
    });
  }
};

// Eliminar una venta por su ID
export const eliminarventas = async (req, res) => {
  try {
    const id_ventas = req.params.id_ventas;
    const [result] = await pool.query('DELETE FROM ventas WHERE id_ventas = ?', [id_ventas]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        mensaje: 'Error al eliminar la venta. El ID ${id_ventas} no fue encontrada'
       });
      }

  // Respuestas sin contenido para indicar exito
     res.sendStatus(204); 
    }catch (error) {
      return res.status(500).json({
        mensaje: 'Ha ocurrido un error al eliminar una venta.',
        error: error
      });
    }
  }

 // Actualizar una Venta
export const actualizarVenta = async (req, res) => {
  try {
    const id_ventas = req.params.id_ventas;
    const { id_Cliente, Fe_Venta } = req.body;

    const [result] = await pool.query(
      'UPDATE Venta SET id_Cliente = ?, Fe_Venta = ? WHERE id_ventas = ?',
      [id_Cliente, Fe_Venta, id_ventas]  
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: 'Error al actualizar. ID ${id_ventas} no encontrado.'
      });
    }

    res.json({
      mensaje:' Venta con ID ${id_ventas} actualizada correctamente.'
    });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al actualizar la venta.',
      error: error
    });
  }
};
