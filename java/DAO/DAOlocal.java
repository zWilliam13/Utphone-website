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
import modelo.local;
/**
 *
 * @author César
 */
public class DAOlocal {
    //Listar productos
    public List<local> lisLocal() {
        List<local> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_local, ciudad, departamento, direccion, telefono from local_atencion";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                local a = new local();
                a.setId(rs.getString(1));
                a.setCiudad(rs.getString(2));
                a.setDepartamento(rs.getString(3));
                a.setDireccion(rs.getString(4));
                a.setTelefono(rs.getInt(5));
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
    
    public void adicionLocal(local u){
        Connection con = MySQLConexion.getConexion();
        String sql = "insert into local_atencion (id_local, ciudad, departamento, direccion, telefono) values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getId());
            st.setString(2, u.getCiudad());
            st.setString(3, u.getDepartamento());
            st.setString(4, u.getDireccion());
            st.setInt(5, u.getTelefono());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void anulaLocal(String idlocal){
        Connection con = MySQLConexion.getConexion();
        String sql = "delete from local_atencion where id_local=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, idlocal);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cambiaLocal(local p){
        Connection con = MySQLConexion.getConexion();
        String sql = "update local_atencion set ciudad=?,departamento=?,direccion=?,telefono=? where id_local=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getCiudad());
            st.setString(2, p.getDepartamento());
            st.setString(3, p.getDireccion());
            st.setInt(4, p.getTelefono());
            st.setString(5, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Listado Filtrando por direccion
    public List<local> filtraLocal(String nom) {
        List<local> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_local, ciudad, departamento, direccion, telefono from local_atencion\n" +
                "where direccion like ?";
            //? =equivale a un parametro 
            PreparedStatement st = conn.prepareStatement(sql);
            //relacionar el ? con su variable 
            st.setString(1, "%"+nom+"%");
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
               local a = new local();
                a.setId(rs.getString(1));
                a.setCiudad(rs.getString(2));
                a.setDepartamento(rs.getString(3));
                a.setDireccion(rs.getString(4));
                a.setTelefono(rs.getInt(5));
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
    //consulta locales por su número de id
    public local consultaLocal(String nro){
 Connection cn=MySQLConexion.getConexion();
 String sql="select id_local, ciudad, departamento, direccion, telefono from local_atencion where id_local=?";
 local p=null;
 try{
    PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, nro);
     ResultSet rs=st.executeQuery();
     if(rs.next()){
         p=new local();
         p.setId(rs.getString(1));
         p.setCiudad(rs.getString(2));
         p.setDepartamento(rs.getString(3));
         p.setDireccion(rs.getString(4));
         p.setTelefono(rs.getInt(5));
     }
 }catch(Exception ex){
     ex.printStackTrace();
 }
     return p;
 }
}
