
package modelo;

/* 🚀 Developed by NelsonJGP */
public class UserCliente {
    private String idCliente;
    private String apPaterno;
    private String apMaterno;
    private String nombres;
    private String correo;
    private String telefono;
    private int tipoDocu;
    private String numDocu;

    public UserCliente(String idCliente, String apPaterno, String apMaterno, String nombres, String correo, String telefono, int tipoDocu, String numDocu) {
        this.idCliente = idCliente;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.nombres = nombres;
        this.correo = correo;
        this.telefono = telefono;
        this.tipoDocu = tipoDocu;
        this.numDocu = numDocu;
    }

    public UserCliente() {
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getTipoDocu() {
        return tipoDocu;
    }

    public void setTipoDocu(int tipoDocu) {
        this.tipoDocu = tipoDocu;
    }

    public String getNumDocu() {
        return numDocu;
    }

    public void setNumDocu(String numDocu) {
        this.numDocu = numDocu;
    }

     
}
