import { pool } from "../../db_connection.js";

// Obtener todos los detalles de compra
export const obtenerDetallesCompra = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM Detalle_Compra");
    res.json(result);
  } catch (error) {
    res.status(500).json({ mensaje: "Error al obtener detalles de compra", error });
  }
};

// Obtener un detalle por ID
export const obtenerDetalleCompra = async (req, res) => {
  try {
    const [result] = await pool.query(
      "SELECT * FROM Detalle_Compra WHERE id_detalle = ?",
      [req.params.id_DetalleCompra]
    );
    if (result.length === 0)
      return res.status(404).json({ mensaje: "Detalle no encontrado" });
    res.json(result[0]);
  } catch (error) {
    res.status(500).json({ mensaje: "Error al obtener detalle", error });
  }
};

// Registrar un nuevo detalle
export const registrarDetalleCompra = async (req, res) => {
  try {
    const { id_Compra, id_Producto, Cantidad, Precio } = req.body;
    const [result] = await pool.query(
      "INSERT INTO Detalle_Compra (id_Compra, id_Producto, Cantidad, Precio) VALUES (?, ?, ?, ?)",
      [id_Compra, id_Producto, Cantidad, Precio]
    );
    res.status(201).json({ id_DetalleCompra: result.insertId });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al registrar detalle", error });
  }
};

// Eliminar
export const eliminarDetalleCompra = async (req, res) => {
  try {
    const [result] = await pool.query(
      "DELETE FROM Detalle_Compra WHERE id_detalle = ?",
      [req.params.id_DetalleCompra]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ mensaje: "Detalle no encontrado" });
    res.json({ mensaje: "Detalle eliminado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al eliminar detalle", error });
  }
};

// Actualizar
export const actualizarDetalleCompra = async (req, res) => {
  try {
    const [result] = await pool.query(
      "UPDATE Detalle_Compra SET ? WHERE id_detalle = ?",
      [req.body, req.params.id]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ mensaje: "Detalle no encontrado" });
    res.json({ mensaje: "Detalle actualizado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al actualizar detalle", error });
  }
};
