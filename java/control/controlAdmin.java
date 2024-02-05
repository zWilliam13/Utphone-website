/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.DAOadmin;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.administrador;

/**
 *
 * @author César
 */
public class controlAdmin extends HttpServlet {

    DAOadmin obj = new DAOadmin();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op = Integer.parseInt(request.getParameter("opc"));
            if (op==1)adicionAdmin(request, response);
            if (op==2)anula(request, response);
            if (op==3)editarAdmin(request, response);
            if (op==4)cambia(request, response);
            if (op==5)filtrar(request, response);
    }

    protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nom = request.getParameter("consulta");
        Gson gs = new Gson();
        out.print(gs.toJson(obj.filtraAdmin(nom)));
    }
    
    protected void adicionAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        administrador p = new administrador();
        p.setNombre(request.getParameter("nombre"));
        p.setTelefono(Integer.parseInt(request.getParameter("tele")));
        p.setCorreo(request.getParameter("correo"));
        p.setId(request.getParameter("user"));
        p.setPass(request.getParameter("pass"));
        obj.adicionAdmin(p);
        String pag = "/pagDashAdmin.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void editarAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String nro=request.getParameter("nro");
      administrador p=obj.consultaAdmin(nro);
      request.setAttribute("dato", p);
      String pag="/regAdmin.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
    } 
    
    protected void anula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nro = request.getParameter("nro");
        obj.anulaAdmin(nro);
        String pag = "/pagDashAdmin.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void cambia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        administrador p = new administrador();
        p.setId(request.getParameter("id"));
        p.setNombre(request.getParameter("nombre"));
        p.setTelefono(Integer.parseInt(request.getParameter("tele")));
        p.setCorreo(request.getParameter("correo"));
        obj.cambiaAdmin(p);
        String pag = "/pagDashAdmin.jsp";
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
