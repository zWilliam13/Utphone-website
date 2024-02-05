package DAO;

import com.mysql.cj.jdbc.CallableStatement;
import interfaces.Itienda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.UserCliente;
import modelo.Usuario;
import modelo.categoria;
import modelo.compra;
import modelo.producto;
import util.MySQLConexion;

public class negocio implements Itienda {

    @Override
    public List<categoria> listCat() {
        Connection cn = MySQLConexion.getConexion();
        List<categoria> lis = new ArrayList();
        try {
            String sql = "Select id_cate, nombre_cate, imagen from categoria";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                categoria c = new categoria();
                c.setId(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setImagen(rs.getString(3));
                lis.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return lis;
    }
    

    @Override
    public List<producto> lisProducto(int id) {
        Connection cn = MySQLConexion.getConexion();
        List<producto> lis = new ArrayList<>();
        try {
            String sql = "SELECT id_producto,nombre, descripcion, precio_uni,id_cate, stock, imagen FROM productos WHERE id_cate=?";
            try (PreparedStatement st = cn.prepareStatement(sql)) {
                st.setInt(1, id);
                try (ResultSet rs = st.executeQuery()) {
                    while (rs.next()) {
                        producto p = new producto();
                        p.setId(rs.getInt(1));
                        p.setNombre(rs.getString(2));
                        p.setDesc(rs.getString(3));
                        p.setPrecio(rs.getDouble(4));
                        p.setCate(rs.getInt(5));
                        p.setStock(rs.getInt(6));
                        p.setImagen(rs.getString(7));
                        lis.add(p);
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
                ex2.printStackTrace();
            }
        }
        return lis;
    }

    @Override
    public producto busProducto(int id) {
        Connection cn = MySQLConexion.getConexion();
        producto p = null;
        try {
            String sql = "select id_producto,nombre, descripcion, precio_uni,id_cate, stock,imagen from productos"
                    + " where id_producto=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = new producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDesc(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setCate(rs.getInt(5));
                p.setStock(rs.getInt(6));
                p.setImagen(rs.getString(7));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return p;
    }
    
    
    @Override
       public UserCliente busCli(String usr) {
        Connection cn = MySQLConexion.getConexion();
        UserCliente p = null;
        try {
            String sql = "Select id_cliente, ap_pate, ap_mate, nombres, correo, telefono, tipo_docu, num_docu from clientes where id_cliente=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, usr);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = new UserCliente();
                p.setIdCliente(rs.getString(1));
                p.setApPaterno(rs.getString(2));
                p.setApMaterno(rs.getString(3));
                p.setNombres(rs.getString(4));
                p.setCorreo(rs.getString(5));
                p.setTelefono(rs.getString(6));
                p.setTipoDocu(rs.getInt(7));
                p.setNumDocu(rs.getString(8));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return p;
    }
    
    
    
    

    //------------------------------------------------------------------
    public producto busPro(int id) {
        Connection cn = MySQLConexion.getConexion();
        producto p = null;
        try {

            String sql = "SELECT id_producto, nombre, descripcion, precio_uni, stock, id_cate, imagen FROM productos WHERE id_producto=?";
            try (PreparedStatement st = cn.prepareStatement(sql)) {
                st.setInt(1, id);
                try (ResultSet rs = st.executeQuery()) {
                    if (rs.next()) {
                        p = new producto();
                        p.setId(rs.getInt(1));
                        p.setNombre(rs.getString(2));
                        p.setDesc(rs.getString(3));
                        p.setPrecio(rs.getDouble(4));
                        p.setStock(rs.getInt(5));
                        p.setCate(rs.getInt(6));
                        p.setImagen(rs.getString(7));
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error en busPro (SQLException): " + ex.getMessage());
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
            System.out.println("Error en busPro (IllegalArgumentException): " + ex.getMessage());
        } finally {
            try {
                // Eliminar la línea cn.close() ya que PreparedStatement y ResultSet se cierran automáticamente
                // cn.close();
            } catch (Exception ex2) {
                ex2.printStackTrace();
            }
        }
        return p;
    }

    @Override
    public void grabaFac(String id_cliente, List<compra> lista) {
        double tot = 0;
        for (compra x : lista) {
            tot = tot + x.total();
        }
        Connection cn = MySQLConexion.getConexion();
        try {
            // Llamar al procedimiento almacenado para obtener el número de factura
            CallableStatement st = (CallableStatement) cn.prepareCall("{call SPFACTURA(?)}");
            st.setString(1, id_cliente);
            ResultSet rs = st.executeQuery();

            // Llamar al procedimiento almacenado para insertar detalles de la factura
            String sql = "{call spdetalle(?,?)}";
            CallableStatement st2 = (CallableStatement) cn.prepareCall(sql);
            for (compra x : lista) {
                st2.setInt(1, x.getId());
                st2.setInt(2, x.getCantidad());
                st2.executeUpdate();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close(); // Asegúrate de cerrar la conexión
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<producto> obtenerProductosPorCategoria(int categoriaId) {
        Connection cn = MySQLConexion.getConexion();
        List<producto> listaProductos = new ArrayList<>();
        try {
            String sql = "SELECT id_producto, nombre, descripcion, precio_uni, stock, id_cate, imagen FROM productos WHERE id_cate = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, categoriaId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                producto p = new producto();
                p.setId(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDesc(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio_uni"));
                p.setStock(rs.getInt("stock"));
                p.setCate(rs.getInt("id_cate"));
                p.setImagen(rs.getString("imagen"));
                listaProductos.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception ex2) {
            }
        }
        return listaProductos;
    }
    
    
}
