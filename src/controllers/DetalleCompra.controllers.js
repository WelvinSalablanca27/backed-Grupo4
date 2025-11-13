import { pool } from "../../db_connection.js";

// ===================== DETALLES DE COMPRA =====================

// Obtener todos los detalles de compra
export const obtenerDetallesCompra = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM DetalleCompra");
    res.json(result);
  } catch (error) {
    res.status(500).json({ mensaje: "Error al obtener detalles de compra", error });
  }
};

// Obtener un detalle por su ID
export const obtenerDetalleCompra = async (req, res) => {
  try {
    const id_DetalleCompra = req.params.id;
    const [result] = await pool.query(
      "SELECT * FROM DetalleCompra WHERE id_DetalleCompra = ?",
      [id_DetalleCompra]
    );

    if (result.length === 0) {
      return res.status(404).json({ mensaje: `Detalle con ID ${id_DetalleCompra} no encontrado.` });
    }

    res.json(result[0]);
  } catch (error) {
    res.status(500).json({ mensaje: "Error al obtener detalle de compra", error });
  }
};

// Registrar un nuevo detalle de compra
export const registrarDetalleCompra = async (req, res) => {
  try {
    const { id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad } = req.body;

    const [result] = await pool.query(
      `INSERT INTO DetalleCompra 
        (id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad) 
        VALUES (?, ?, ?, ?, ?, ?)`,
      [id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad]
    );

    res.status(201).json({ id_DetalleCompra: result.insertId });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al registrar detalle de compra", error });
  }
};

// Actualizar un detalle de compra
export const actualizarDetalleCompra = async (req, res) => {
  try {
    const id_DetalleCompra = req.params.id;
    const { id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad } = req.body;

    const [result] = await pool.query(
      `UPDATE DetalleCompra 
       SET id_Producto = ?, Cantidad = ?, Precio = ?, Fe_Ingresado = ?, Fe_caducidad = ? 
       WHERE id_DetalleCompra = ?`,
      [id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad, id_DetalleCompra]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ mensaje: `Detalle con ID ${id_DetalleCompra} no encontrado.` });
    }

    res.json({ mensaje: "Detalle actualizado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al actualizar detalle de compra", error });
  }
};

// Eliminar un detalle de compra
export const eliminarDetalleCompra = async (req, res) => {
  try {
    const id_DetalleCompra = req.params.id;

    const [result] = await pool.query(
      "DELETE FROM DetalleCompra WHERE id_DetalleCompra = ?",
      [id_DetalleCompra]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ mensaje: `Detalle con ID ${id_DetalleCompra} no encontrado.` });
    }

    res.json({ mensaje: "Detalle eliminado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al eliminar detalle de compra", error });
  }
};
