/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.empleado;
import DAO.DAOempleado;
import com.google.gson.Gson;
/**
 *
 * @author César
 */
public class controlEmpleado extends HttpServlet {

    DAOempleado obj = new DAOempleado();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op = Integer.parseInt(request.getParameter("opc"));
            if (op==1)adicionEmpleado(request, response);
            if (op==2)anula(request, response);
            if (op==3)editarEmpleado(request, response);
            if (op==4)cambia(request, response);
            if (op==5)filtrar(request, response);
    }
    
    protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nom = request.getParameter("consulta");
        Gson gs = new Gson();
        out.print(gs.toJson(obj.filtraEmpleado(nom)));
    }
    
    protected void adicionEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        empleado p = new empleado();
        p.setIdlocal(request.getParameter("idlocal"));
        p.setAp_pate(request.getParameter("ap_pate"));
        p.setAp_mate(request.getParameter("ap_mate"));
        p.setNombres(request.getParameter("nombre"));
        p.setCorreo(request.getParameter("correo"));
        p.setTipo_doc(Integer.parseInt(request.getParameter("tipodoc")));
        p.setNum_doc(Integer.parseInt(request.getParameter("numdoc")));
        p.setIdemp(request.getParameter("idemp"));
        p.setPass(request.getParameter("pass"));
        obj.adicionEmpleado(p);
        String pag = "/pagDashEmpleado.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void editarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String nro=request.getParameter("nro");
      empleado p=obj.consultaEmpleado(nro);
      request.setAttribute("dato", p);
      String pag="/pagEditarEmpleado.jsp";
      request.getRequestDispatcher(pag).forward(request, response);
    } 
    
    protected void anula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nro = request.getParameter("nro");
        obj.anulaEmpleado(nro);
        String pag = "/pagDashEmpleado.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    protected void cambia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        empleado p = new empleado();
        p.setIdlocal(request.getParameter("idlocal"));
        p.setAp_pate(request.getParameter("ap_pate"));
        p.setAp_mate(request.getParameter("ap_mate"));
        p.setNombres(request.getParameter("nombre"));
        p.setCorreo(request.getParameter("correo"));
        p.setTipo_doc(Integer.parseInt(request.getParameter("tipodoc")));
        p.setNum_doc(Integer.parseInt(request.getParameter("numdoc")));
        p.setIdemp(request.getParameter("idemp"));
        obj.cambiaEmpleado(p);
        String pag = "/pagDashEmpleado.jsp";
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
