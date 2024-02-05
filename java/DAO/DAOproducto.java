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
import util.*;
import modelo.*;
/**
 *
 * @author César
 */
public class DAOproducto {
    //Listar productos
    public List<producto> lisProd() {
        List<producto> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto, nombre, descripcion, precio_uni, stock, id_cate, imagen from productos";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                producto a = new producto();
                a.setId(rs.getInt(1));
                a.setNombre(rs.getString(2));
                a.setDesc(rs.getString(3));
                a.setPrecio(rs.getDouble(4));
                a.setCate(rs.getInt(5));
                a.setStock(rs.getInt(6));
                a.setImagen(rs.getString(7));
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
    
    //Listar Categorias
    public List<categoria> lisCate() {
        List<categoria> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_cate, nombre_cate from categoria";
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
    
    public void adicionProducto(producto u){
        Connection con = MySQLConexion.getConexion();
        String sql = "insert into productos (nombre, descripcion, precio_uni, stock, id_cate) values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getNombre());
            st.setString(2, u.getDesc());
            st.setDouble(3, u.getPrecio());
            st.setInt(4, u.getStock());
            st.setInt(5, u.getCate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void anulaProd(int idPro){
        Connection con = MySQLConexion.getConexion();
        String sql = "delete from productos where id_producto=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idPro);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cambiaProd(producto p){
        Connection con = MySQLConexion.getConexion();
        String sql = "update productos set nombre=?,descripcion=?,precio_uni=?,stock=?,id_cate=? where id_producto=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getNombre());
            st.setString(2, p.getDesc());
            st.setDouble(3, p.getPrecio());
            st.setInt(4, p.getStock());
            st.setInt(5, p.getCate());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Listado Filtrando por apellido paterno o materno
    public List<producto> filtraProd(String nom) {
        List<producto> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_producto,nombre, descripcion, precio_uni, stock, id_cate, imagen from productos\n" +
                "where nombre like ?";
            //? =equivale a un parametro 
            PreparedStatement st = conn.prepareStatement(sql);
            //relacionar el ? con su variable 
            st.setString(1, "%"+nom+"%");
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
               producto a = new producto();
                a.setId(rs.getInt(1));
                a.setNombre(rs.getString(2));
                a.setDesc(rs.getString(3));
                a.setPrecio(rs.getDouble(4));
                a.setStock(rs.getInt(5));
                a.setCate(rs.getInt(6));
                a.setImagen(rs.getString(7));
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
    //consulta productos por su número de id
    public producto consultaProd(int nro){
 Connection cn=MySQLConexion.getConexion();
 String sql="select id_producto,nombre,descripcion,precio_uni,stock,id_cate from productos where id_producto=?";
 producto p=null;
 try{
    PreparedStatement st=cn.prepareStatement(sql);
     st.setInt(1, nro);
     ResultSet rs=st.executeQuery();
     if(rs.next()){//si lo encontro  crea la clase prestamo
         p=new producto();
         p.setId(rs.getInt(1));
         p.setNombre(rs.getString(2));
         p.setDesc(rs.getString(3));
         p.setPrecio(rs.getDouble(4));
         p.setStock(rs.getInt(5));
         p.setCate(rs.getInt(6));
     }
 }catch(Exception ex){
     ex.printStackTrace();
 }
     return p;
 }
    
    
    public List<producto> lisProdPorCategoria(String categoria) {
    List<producto> listaProductos = new ArrayList<>();
    Connection conn = null;
    try {
        conn = MySQLConexion.getConexion();
        String sql = "SELECT id_producto, nombre, descripcion, precio_uni, stock, id_cate FROM productos " +
                     "WHERE id_cate = (SELECT id_cate FROM categoria WHERE nombre_cate = ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, categoria);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            producto p = new producto();
            p.setId(rs.getInt("id_producto"));
            p.setNombre(rs.getString("nombre"));
            p.setDesc(rs.getString("descripcion"));
            p.setPrecio(rs.getDouble("precio_uni"));
            p.setStock(rs.getInt("stock"));
            p.setCate(rs.getInt("id_cate"));
            listaProductos.add(p);
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
    return listaProductos;
}
public List<producto> cargarProductosPorCategoria(String categoria) {
    List<producto> productos = new ArrayList<>();
    Connection conn = null;

    try {
        conn = MySQLConexion.getConexion();
        String sql = "SELECT id_producto, nombre, descripcion, precio_uni, stock FROM productos " +
                     "WHERE id_cate = (SELECT id_cate FROM categoria WHERE nombre_cate = ?)";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, categoria);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            producto p = new producto();
            p.setId(rs.getInt("id_producto"));
            p.setNombre(rs.getString("nombre"));
            p.setDesc(rs.getString("descripcion"));
            p.setPrecio(rs.getDouble("precio_uni"));
            p.setStock(rs.getInt("stock"));
            productos.add(p);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
    
    return productos;
}

}
