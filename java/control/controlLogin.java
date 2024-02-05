package control;

import DAO.DAOLogin;
import DAO.negocio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.UserCliente;
import modelo.Usuario;

/**
 *
 * @author Nelson
 */
public class controlLogin extends HttpServlet {

    DAOLogin obj = new DAOLogin();
    negocio objCli = new  negocio();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==5)verificaUsuario(request, response);
        if(op==6)login(request, response);
        if(op==2)registrarUsuario(request, response);
        
    }
    
    protected void verificaUsuario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Obtén los parámetros de la solicitud (idusuario y contrasena)
        String idusuario = request.getParameter("iduser");
        String contrasena = request.getParameter("contrasena");

        // Verificación de Usuario
        Usuario usuario = obj.iniciarSesion(idusuario, contrasena);
        
        if (usuario != null) {
            // Usuario existe, ahora verifica la contraseña
            if (usuario.getContrasena().equals(contrasena)) {
                int tipoUsuario = usuario.getTipoUsuario();
                String pag = "";
                // Páginas según el tipo de usuario
                switch (tipoUsuario) {
                    case 1:
                        pag = "/pagDash.jsp";
                        break;
                    case 2:
                        pag = "/index.jsp";
                        break;
                    case 3:
                        pag = "/ConfirmaProductos.jsp";
                        break;
                    default:
                        pag = "/pagina_de_error.jsp";
                }
                request.getRequestDispatcher(pag).forward(request, response);
            } else {
                // Contraseña incorrecta
                request.setAttribute("errorMensaje", "Contraseña incorrecta");
                request.getRequestDispatcher("/user_login.jsp").forward(request, response);
            }
        } else {
            // Usuario incorrecto
            request.setAttribute("errorMensaje", "Usuario incorrecto");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        }
    }
    
    protected void login(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        String idusuario = request.getParameter("iduser");
        String contrasena = request.getParameter("contrasena");
        
        // Verificación de Usuario
        Usuario usuario = obj.iniciarSesion(idusuario, contrasena);
        HttpSession ses=request.getSession();
        int res=0;
        String pag="/user_login_confirma.jsp";
        if(usuario != null){
            String clave = usuario.getContrasena();
            if(clave.equals(contrasena)) {
                UserCliente cli= objCli.busCli(idusuario);
                ses.setAttribute("cliente", cli);
                pag="/ConfirmaProductos.jsp";
            } else
            res=2;
        }
        else res=1;
        ses.setAttribute("resp", res);
        getServletContext().getRequestDispatcher(pag).forward(request,
        response);
    }
    
    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombres = request.getParameter("nombre_usuario");
        String correo = request.getParameter("correo");
       
        String idusuario = request.getParameter("idusuario");
        String contrasena = request.getParameter("contrasena");
        
        String telefono = request.getParameter("telefono");
        String apPaterno = request.getParameter("ap_paterno");
        String apMaterno = request.getParameter("ap_materno");
        int tipoDocu = Integer.parseInt(request.getParameter("tipo_docu"));
        String numDocu = request.getParameter("num_docu");

        String idCliente = idusuario;
        
        //Registro de Usuario
        Usuario nuevoUsuario = new Usuario(idCliente, contrasena);
        nuevoUsuario.setTipoUsuario(3);
        obj.registrarUsuario(nuevoUsuario);
        
        //Registro de Cliente
        UserCliente nuevoCliente = new UserCliente(idCliente, apPaterno, apMaterno, nombres, correo, telefono, tipoDocu, numDocu);
        obj.registrarCliente(nuevoCliente);
        
        // Redirecciona a la página de éxito
        response.sendRedirect("user_reg_exitoso.jsp");
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
