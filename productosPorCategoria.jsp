<%@page import="DAO.negocio"%>
<%@page import="java.util.List"%>
<%@page import="modelo.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Productos por Categoría</title>
    </head>
    <body>
       <h1>Productos de la categoría: <%= request.getParameter("categoriaId") %></h1>


<% negocio negocioDao = new negocio();
  List<producto> productosPorCategoria = negocioDao.obtenerProductosPorCategoria(Integer.parseInt(request.getParameter("categoria")));
%>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
        </tr>
    </thead>
    <tbody>
        <% for (producto producto : negocioDao.obtenerProductosPorCategoria(Integer.parseInt(request.getParameter("categoria")))) { %>
            <tr>
                <td><%= producto.getId() %></td>
                <td><%= producto.getNombre() %></td>
                <td><%= producto.getDesc() %></td>
                <td><%= producto.getPrecio() %></td>
                <td><%= producto.getImagen()%></td>
            </tr>
        <% } %>
    </tbody>
</table>

    </body>
</html>
