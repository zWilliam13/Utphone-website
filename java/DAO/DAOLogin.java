
package DAO;

import java.sql.*;
import modelo.*;
import util.MySQLConexion;

/* 🚀 Developed by NelsonJGP */
public class DAOLogin {
    
    public Usuario iniciarSesion(String usuario, String contraseña) {
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT tipo FROM usuario WHERE id_usuario = ? AND pass = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, usuario);
            st.setString(2, contraseña);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int tipoUsuario = rs.getInt("tipo");
                Usuario user = new Usuario(usuario, contraseña);
                user.setTipoUsuario(tipoUsuario);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Devuelve null si no se encontró un usuario
    }

    public void registrarUsuario(Usuario usuario) {
        Connection conn = MySQLConexion.getConexion();
        String sql = "INSERT INTO usuario (id_usuario, pass, tipo) VALUES (?, ?, ?)";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getIdusuario());
            stmt.setString(2, usuario.getContrasena());
            stmt.setInt(3, usuario.getTipoUsuario());

            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void registrarCliente(UserCliente cliente) {
        Connection conn = MySQLConexion.getConexion();
        String sql = "INSERT INTO clientes (id_cliente, ap_pate, ap_mate, nombres, correo, telefono, tipo_docu, num_docu) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getIdCliente());
            stmt.setString(2, cliente.getApPaterno());
            stmt.setString(3, cliente.getApMaterno());
            stmt.setString(4, cliente.getNombres());
            stmt.setString(5, cliente.getCorreo());
            stmt.setString(6, cliente.getTelefono());
            stmt.setInt(7, cliente.getTipoDocu());
            stmt.setString(8, cliente.getNumDocu());

            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
