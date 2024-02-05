package modelo;

public class Usuario {
    private String idusuario;
    private String contrasena;
    private int tipoUsuario; // Agregar el tipo de usuario si es necesario

     public Usuario() {
    }
    public Usuario(String idusuario, String contrasena) {
        this.idusuario = idusuario;
        this.contrasena = contrasena;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    
}