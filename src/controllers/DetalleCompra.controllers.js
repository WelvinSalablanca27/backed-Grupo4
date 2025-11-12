import { pool } from "../../db_connection.js";

// Obtener todos los detalles de compra
export const obtenerDetallesCompra = async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM DetalleCompra");
    res.json(result);
  } catch (error) {
    res.status(500).json({ mensaje: "Error al obtener detalles de compra", error });
  }
};

// Obtener un detalle por ID
export const obtenerDetalleCompra = async (req, res) => {
  try {
    const id = req.params.id; // nombre consistente con la ruta
    const [result] = await pool.query(
      "SELECT * FROM DetalleCompra WHERE id_DetalleCompra = ?",
      [id]
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
    const { id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad } = req.body;
    const [result] = await pool.query(
      "INSERT INTO DetalleCompra (id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad) VALUES (?, ?, ?, ?, ?, ?)",
      [id_compra, id_Producto, Cantidad, Precio, Fe_Ingresado, Fe_caducidad]
    );
    res.status(201).json({ id_DetalleCompra: result.insertId });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al registrar detalle", error });
  }
};

// Eliminar un detalle
export const eliminarDetalleCompra = async (req, res) => {
  try {
    const id = req.params.id;
    const [result] = await pool.query(
      "DELETE FROM DetalleCompra WHERE id_DetalleCompra = ?",
      [id]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ mensaje: "Detalle no encontrado" });
    res.json({ mensaje: "Detalle eliminado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al eliminar detalle", error });
  }
};

// Actualizar un detalle
export const actualizarDetalleCompra = async (req, res) => {
  try {
    const id = req.params.id;
    const [result] = await pool.query(
      "UPDATE DetalleCompra SET ? WHERE id_DetalleCompra = ?",
      [req.body, id]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ mensaje: "Detalle no encontrado" });
    res.json({ mensaje: "Detalle actualizado correctamente" });
  } catch (error) {
    res.status(500).json({ mensaje: "Error al actualizar detalle", error });
  }
};
