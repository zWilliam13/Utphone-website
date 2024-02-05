/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.cantEmp;
import modelo.categoria;
import modelo.ventas;
import util.MySQLConexion;

/**
 *
 * @author César
 */
public class DAOgraf {
    public List<cantEmp> lisEmpleado() {
        List<cantEmp> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select COUNT(e.id_empleado) as Empleados, Concat(l.direccion,', ',l.ciudad,' - ',l.departamento) as direccion, l.id_local\n" +
"from empleados e join local_atencion l on e.id_local = l.id_local\n" +
"group by l.id_local;";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cantEmp a = new cantEmp();
                a.setNumEmp(rs.getInt(1));
                a.setDirLocal(rs.getString(2));
                a.setIdLocal(rs.getString(3));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lis;
    }
    
    public List<ventas> lisVentasMes(String an) {
        List<ventas> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select month(d.fecha_operacion) as Mes, count(v.id_venta) as Ventas, sum(p.precio_uni*d.cantidad-(p.precio_uni*(d.descuento/100))) as Total\n" +
"from productos p join detalle_venta d on p.id_producto = d.id_producto\n" +
"join ventas v on d.id_venta=v.id_venta\n" +
"where cast(year(d.fecha_operacion) as char) like ?\n" +
"group by month(d.fecha_operacion);";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, an+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ventas a = new ventas();
                a.setMes(rs.getInt(1));
                a.setCantidad(rs.getInt(2));
                a.setTotal(rs.getDouble(3));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lis;
    }
    
    public List<ventas> lisVentasAn() {
        List<ventas> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select year(d.fecha_operacion), count(v.id_venta) as Ventas, sum(p.precio_uni*d.cantidad-(p.precio_uni*(d.descuento/100))) as Total\n" +
"from productos p join detalle_venta d on p.id_producto = d.id_producto\n" +
"join ventas v on d.id_venta=v.id_venta\n" +
"group by year(d.fecha_operacion);";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ventas a = new ventas();
                a.setMes(rs.getInt(1));
                a.setCantidad(rs.getInt(2));
                a.setTotal(rs.getDouble(3));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lis;
    }
    
    public List<categoria> lisCatePro() {
        List<categoria> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select COUNT(p.id_producto) as Productos, c.nombre_cate as Categoria\n" +
"from productos p join categoria c on p.id_cate = c.id_cate\n" +
"group by c.nombre_cate;";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                categoria a = new categoria();
                a.setId(rs.getInt(1));
                a.setNombre(rs.getString(2));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lis;
    }
    
    public List<ventas> lisFecha() {
        List<ventas> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT DISTINCT year(fecha_operacion) fecha FROM detalle_venta;";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ventas a = new ventas();
                a.setMes(rs.getInt(1));
                lis.add(a);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
            }
        }
        return lis;
    }
}
