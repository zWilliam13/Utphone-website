/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.DAOLogin;
import DAO.negocio;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.UserCliente;
import modelo.Usuario;
import modelo.compra;
import modelo.producto;

/**
 *
 * @author HOME
 */
public class controlCarrito extends HttpServlet {

    negocio obj = new negocio();
    DAOLogin obj1 = new DAOLogin();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) {
            listarProducto(request, response);
        }
        if(op == 2) borraItem(request,response);
        if (op == 3) {
            detalle(request, response);
        }
        if (op == 4) {
            carrito(request, response);
        }
        if (op == 5) {
            login(request, response);
        }
        if (op == 6) {
            grabaFactura(request, response);
        }
    }

    private void listarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("categoria");

        if (cod != null && !cod.isEmpty()) {
            request.setAttribute("dato", obj.lisProducto(Integer.parseInt(cod)));
        } else {
           
        }

        String pag = "ProductosCate.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void borraItem(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        HttpSession ses = request.getSession();
        int ind = Integer.parseInt(request.getParameter("ind"));
        List<compra> lista = (ArrayList<compra>)ses.getAttribute("canasta");
        lista.remove(ind);
        ses.setAttribute("canasta", lista);
        String pag = "CompraProductos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    private void detalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cod = request.getParameter("cod");
        producto prod = null;

        try {
            int id = Integer.parseInt(cod);
            prod = obj.busProducto(id);
          

            if (prod != null) {
                request.setAttribute("dato", prod);
            }

        } catch (NumberFormatException e) {
            // Cod no es un número válido
            e.printStackTrace();
        }

        String pag = "ProductosDeta.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    
    
       private void carrito(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        HttpSession ses = request.getSession();
        String cod = request.getParameter("cod");
        int can = Integer.parseInt(request.getParameter("cantidad"));
        
        producto pro = obj.busProducto(Integer.parseInt(cod));
        compra cp = new compra();
        cp.setCantidad(can);
        cp.setId(Integer.parseInt(cod));
        cp.setNombre(pro.getNombre());
        cp.setDesc(pro.getDesc());
        cp.setPrecio(pro.getPrecio());
        cp.setCate(pro.getCate());
        cp.setStock(pro.getStock());
        cp.setImagen(pro.getImagen());
        
        List<compra> lista;
        if(ses.getAttribute("canasta") == null){
            lista = new ArrayList(); //Se crea la lista
        }else{
            lista = (ArrayList<compra>)ses.getAttribute("canasta");
        }
        lista.add(cp);
        ses.setAttribute("canasta", lista);
        
        String pag = "CompraProductos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
         protected void login(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String idusuario = request.getParameter("iduser");
        String contrasena = request.getParameter("contrasena");
        
        // Verificación de Usuario
        Usuario usuario = obj1.iniciarSesion(idusuario, contrasena);
        HttpSession ses=request.getSession();
        int res=0;
        String pag="/user_login_confirma.jsp";
        if(usuario != null){
            String clave = usuario.getContrasena();
            if(clave.equals(contrasena)) {
                UserCliente cli= obj.busCli(idusuario);
                ses.setAttribute("cliente", cli);
                pag="/ConfirmaProductos.jsp";
            } else
            res=2;
        }
        else res=1;
        ses.setAttribute("resp", res);
        getServletContext().getRequestDispatcher(pag).forward(request,
        response);
        out.close();
    }
    
    private void grabaFactura(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        HttpSession ses = request.getSession();
        List<compra> lista = (ArrayList<compra>)ses.getAttribute("canasta");
        UserCliente cli = (UserCliente)ses.getAttribute("cliente");
        obj.grabaFac(cli.getIdCliente(), lista);
        double sm=0;
        String ape = cli.getApPaterno()+" "+cli.getApMaterno()+", "+cli.getNombres();
        for (compra c : lista) {
            sm=sm+c.total();
        }
        request.setAttribute("nombre", ape);
        request.setAttribute("total", sm);
        ses.setAttribute("canasta", null);
        ses.setAttribute("cliente", null);
        
        String cad = "Apellido y Nombre:"+ape+"<br>";
        cad+="<br> Total a pagar: "+sm;
        //out.print("<iframe name='zona' width='500' height='500'></iframe>");
        //response.sendRedirect("qrimage?texto="+cad+" target='zona'");
        String pag = "CompraResumen.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    private void carrito1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("categoria");

        if (cod != null && !cod.isEmpty()) {
            request.setAttribute("dato", obj.lisProducto(Integer.parseInt(cod)));
        } else {
            // Handle the case where "cod" is null or empty
            // You might want to provide a default value or show an error message
        }

        String pag = "ProductosCate.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
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
