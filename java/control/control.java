/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.DAOproducto;
import DAO.DAOgraf;
import DAO.negocio;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.producto;

/**
 *
 * @author César
 */
public class control extends HttpServlet {

    DAOproducto obj = new DAOproducto();
    DAOgraf obj2 = new DAOgraf();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int op = Integer.parseInt(request.getParameter("opc"));
            if (op==1)adicionProducto(request, response);
            if (op==2)anula(request, response);
            if (op==3)editarProducto(request, response);
            if (op==4)cambia(request, response);
            if (op==5)filtrar(request, response);
            if (op==6)listarProductosPorCategoria(request, response);
            if (op==7)filtrarVentas(request, response);
    }
    
    protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nom = request.getParameter("consulta");
        Gson gs = new Gson();
        out.print(gs.toJson(obj.filtraProd(nom)));
    }

    protected void filtrarVentas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nom =request.getParameter("consulta");
        Gson gs = new Gson();
        out.print(gs.toJson(obj2.lisVentasMes(nom)));
    }
    
    protected void adicionProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        producto p = new producto();
        p.setNombre(request.getParameter("nombre"));
        p.setDesc(request.getParameter("desc"));
        p.setPrecio(Double.parseDouble(request.getParameter("prec")));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setCate(Integer.parseInt(request.getParameter("cate")));
        obj.adicionProducto(p);
        String pag = "/pagDash.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void editarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int nro = Integer.parseInt(request.getParameter("nro"));
        producto p = obj.consultaProd(nro);
        request.setAttribute("dato", p);
        String pag = "/pagEditarProducto.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void anula(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int nro = Integer.parseInt(request.getParameter("nro"));
        obj.anulaProd(nro);
        String pag = "/pagDash.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void cambia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        producto p = new producto();
        p.setNombre(request.getParameter("nom"));
        p.setDesc(request.getParameter("desc"));
        p.setPrecio(Double.parseDouble(request.getParameter("precio")));
        p.setStock(Integer.parseInt(request.getParameter("stock")));
        p.setCate(Integer.parseInt(request.getParameter("cate")));
        obj.cambiaProd(p);
        String pag = "/pagDash.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void listarProductosPorCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));

        negocio negocioDao = new negocio();
        List<producto> productosPorCategoria = negocioDao.obtenerProductosPorCategoria(categoriaId);

        request.setAttribute("categoriaId", categoriaId);
        request.getRequestDispatcher("productosPorCategoria.jsp").forward(request, response);
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
