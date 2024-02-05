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
import modelo.empleado;
import modelo.local;
import util.MySQLConexion;

/**
 *
 * @author César
 */
public class DAOempleado {
    //Listar productos
    public List<empleado> lisEmpleado() {
        List<empleado> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT id_empleado, id_local, CONCAT(ap_pate,' ',ap_mate,' ',nombres) as nombres, correo, tipo_docu, num_docu FROM `empleados`";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                empleado a = new empleado();
                a.setIdemp(rs.getString(1));
                a.setIdlocal(rs.getString(2));
                a.setNombres(rs.getString(3));
                a.setCorreo(rs.getString(4));
                a.setTipo_doc(rs.getInt(5));
                a.setNum_doc(6);
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
    public List<local> lisLocal() {
        List<local> lis = new ArrayList<>();
        Connection conn = null;
        try {
            conn = MySQLConexion.getConexion();
            String sql = "select id_local, direccion, ciudad from local_atencion";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                local a = new local();
                a.setId(rs.getString(1));
                a.setDireccion(rs.getString(2));
                a.setCiudad(rs.getString(3));
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
    
    public void adicionEmpleado(empleado u){
        Connection con = MySQLConexion.getConexion();
        String sql = "insert into usuario (id_usuario,pass,tipo) values(?,?,2);";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getIdemp());
            st.setString(2, u.getPass());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        String sql2 = "insert into empleados (id_empleado, id_local, ap_pate, ap_mate, nombres, correo, tipo_docu, num_docu) values(?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = con.prepareStatement(sql2);
            st.setString(1, u.getIdemp());
            st.setString(2, u.getIdlocal());
            st.setString(3, u.getAp_pate());
            st.setString(4, u.getAp_mate());
            st.setString(5, u.getNombres());
            st.setString(6, u.getCorreo());
            st.setInt(7, u.getTipo_doc());
            st.setInt(8, u.getNum_doc());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void anulaEmpleado(String idEmp){
        Connection con = MySQLConexion.getConexion();
        String sql2 = "delete from empleados where id_empleado=?";
        try {
            PreparedStatement st = con.prepareStatement(sql2);
            st.setString(1, idEmp);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String sql = "delete from usuario where id_usuario=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, idEmp);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void cambiaEmpleado(empleado p){
        Connection con = MySQLConexion.getConexion();
        String sql = "update empleados set id_local=?, ap_pate=?, ap_mate=?, nombres=?, correo=?, tipo_docu=?, num_docu=? where id_empleado=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getIdlocal());
            st.setString(2, p.getAp_pate());
            st.setString(3, p.getAp_mate());
            st.setString(4, p.getNombres());
            st.setString(5, p.getCorreo());
            st.setInt(6, p.getTipo_doc());
            st.setInt(7, p.getNum_doc());
            st.setString(8, p.getIdemp());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Listado Filtrando por nombre
    public List<empleado> filtraEmpleado(String nom) {
        List<empleado> lis = new ArrayList<>();
        Connection conn = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "Select id_empleado, id_local, CONCAT(ap_pate,' ',ap_mate,', ',nombres) as nombres, correo, tipo_docu, num_docu FROM empleados where nombres like ?";
            //? =equivale a un parametro 
            PreparedStatement st = conn.prepareStatement(sql);
            //relacionar el ? con su variable 
            st.setString(1, "%"+nom+"%");
            ResultSet rs = st.executeQuery();
            //llenar el arraylist con la clase entidad
            while (rs.next()) {
               empleado a = new empleado();
                a.setIdemp(rs.getString(1));
                a.setIdlocal(rs.getString(2));
                a.setNombres(rs.getString(3));
                a.setCorreo(rs.getString(4));
                a.setTipo_doc(rs.getInt(5));
                a.setNum_doc(rs.getInt(6));
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
    public empleado consultaEmpleado(String nro){
 Connection cn=MySQLConexion.getConexion();
 String sql="SELECT id_empleado, id_local, ap_pate, ap_mate, nombres, correo, tipo_docu, num_docu FROM empleados where id_empleado=?";
 empleado p=null;
 try{
    PreparedStatement st=cn.prepareStatement(sql);
     st.setString(1, nro);
     ResultSet rs=st.executeQuery();
     if(rs.next()){//si lo encontro  crea la clase prestamo
         p=new empleado();
         p.setIdemp(rs.getString(1));
         p.setIdlocal(rs.getString(2));
         p.setAp_pate(rs.getString(3));
         p.setAp_mate(rs.getString(4));
         p.setNombres(rs.getString(5));
         p.setCorreo(rs.getString(6));
         p.setTipo_doc(rs.getInt(7));
         p.setNum_doc(rs.getInt(8));
     }
 }catch(Exception ex){
     ex.printStackTrace();
 }
     return p;
 }
}
