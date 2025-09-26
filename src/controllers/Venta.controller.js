import { pool } from '../../db_connection.js';

// Obtener todas las Venta
export const obtenerVentas = async (req, res) => {
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
    const id_Venta = req.params.id_Venta;
    const [result] = await pool.query('SELECT * FROM Venta WHERE id_Venta= ?', [req.params.id_Venta])
    if (result.length <= 0) {
      return res.status(404).json({
        mensaje: `Error al leer los datos. ID ${id_Venta} no encontrado.`
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
    const { id_Cliente, Fe_Venta, total_venta } = req.body;
    const [result] = await pool.query(
      'INSERT INTO Venta (id_Cliente, Fe_Venta, total_venta) VALUES  (?, ?, ?)',
      [ id_Cliente, Fe_Venta, total_venta ]
    );
    res.status(201).json({ id_Venta: result.insertId });
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
    const id_venta = req.params.id_venta;
    const [result] = await pool.query('DELETE FROM ventas WHERE id_venta = ?', [id_venta]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ 
        mensaje: 'Error al eliminar la venta. El ID ${id_venta} no fue encontrada'
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

  // Actualizar una venta por su ID
export const actualizarVentas = async (req, res) => {
  try {
    const id_venta = req.params.id_venta;
    const { cliente, fecha, total } = req.body;

    if (cliente === undefined || fecha === undefined || total === undefined) {
      return res.status(400).json({
        mensaje: 'todos los campos se llenan obligatoriamente).'
      });
    }

    const [result] = await pool.query(
      'UPDATE ventas SET cliente = ?, fecha = ?, total = ? WHERE id_venta = ?',
      [cliente, fecha, total, id_venta]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        mensaje: `No se encontró una venta con ID ${id_venta}`
      });
    }

    res.status(200).json({ mensaje: 'Venta actualizada correctamente.' });
  } catch (error) {
    return res.status(500).json({
      mensaje: 'Ha ocurrido un error al actualizar la venta.',
      error: error.message
    });
  }
}
