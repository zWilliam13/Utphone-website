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
import modelo.administrador;
import util.MySQLConexion;

/**
 *
 * @author César
 */
public class DAOadmin {
    //Listar productos
    public List<administrador> lisAdmin() {
        List<administrador> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_usuario, nombre, correo, telefono from administrador";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                administrador a = new administrador();
                a.setId(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setCorreo(rs.getString(3));
                a.setTelefono(rs.getInt(4));
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
    
    public void adicionAdmin(administrador u){
        Connection con = MySQLConexion.getConexion();
        String sql = "insert into usuario (id_usuario,pass,tipo) values(?,?,1);";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getId());
            st.setString(2, u.getPass());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        String sql2 = "insert into administrador (id_usuario, nombre, correo, telefono) values(?, ?, ?, ?);";
        try {
            PreparedStatement st = con.prepareStatement(sql2);
            st.setString(1, u.getId());
            st.setString(2, u.getNombre());
            st.setString(3, u.getCorreo());
            st.setInt(4, u.getTelefono());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void anulaAdmin(String idAdm){
        Connection con = MySQLConexion.getConexion();
        String sql2 = "delete from administrador where id_usuario=?";
        try {
            PreparedStatement st = con.prepareStatement(sql2);
            st.setString(1, idAdm);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String sql = "delete from usuario where id_usuario=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, idAdm);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cambiaAdmin(administrador p){
        Connection con = MySQLConexion.getConexion();
        String sql = "update administrador set nombre=?,correo=?,telefono=? where id_usuario=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getNombre());
            st.setString(2, p.getCorreo());
            st.setDouble(3, p.getTelefono());
            st.setString(4, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Listado Filtrando por nombre
    public List<administrador> filtraAdmin(String nom) {
        List<administrador> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_usuario,nombre, correo, telefono from administrador\n" +
                "where nombre like ?";
            //? =equivale a un parametro 
            PreparedStatement st = conn.prepareStatement(sql);
            //relacionar el ? con su variable 
            st.setString(1, "%"+nom+"%");
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
               administrador a = new administrador();
                a.setId(rs.getString(1));
                a.setNombre(rs.getString(2));
                a.setCorreo(rs.getString(3));
                a.setTelefono(rs.getInt(4));
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
    //consulta administrador por su número de id
    public administrador consultaAdmin(String nro){
 Connection cn=MySQLConexion.getConexion();
 String sql="select id_usuario,nombre,correo,telefono from administrador where id_usuario=?";
 administrador p=null;
 try{
    PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, nro);
     ResultSet rs=st.executeQuery();
     if(rs.next()){//si lo encontro  crea la clase prestamo
         p=new administrador();
         p.setId(rs.getString(1));
         p.setNombre(rs.getString(2));
         p.setCorreo(rs.getString(3));
         p.setTelefono(rs.getInt(4));
     }
 }catch(Exception ex){
     ex.printStackTrace();
 }
     return p;
 }
}
