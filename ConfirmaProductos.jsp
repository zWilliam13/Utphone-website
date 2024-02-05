<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*, modelo.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UTPhone | Confirmar productos</title>        
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <meta property="twitter:card" content="summary_large_image" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" data-tag="font" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" data-tag="font" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" data-tag="font" />
        <link rel="icon" href="imgPag/ico1.png"/>
        <link href="CSS/index.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/c01fb11645.js" crossorigin="anonymous"></script>
        <style>
            .card-title-custom {
                font-size: 24px;
                font-weight: bold;
            }
        </style>

    </head>
    <body>
        <header> 
            <div class="contenedor">
                <nav class="menu">
                    <a href="index.jsp"><img  src="Imagenes/te.png"></a>
                    <ul class="menu-lista">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="nosotros.jsp">Nosotros</a></li>
                        <li><a href="productos.jsp">Productos</a></li>
                        <li><a href="contactanos.jsp">Contactanos</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <%
            HttpSession ses = request.getSession();
            List<compra> lista = (ArrayList<compra>) ses.getAttribute("canasta");
            UserCliente cli = (UserCliente) ses.getAttribute("cliente");
            String id = (cli != null) ? cli.getNombres()+", "+cli.getApPaterno(): "Cliente no disponible";
        %>
    <center>
        <br>
        <h2>Lista de Compras del cliente: <%=id%></h2><br>
        <a href="controlCarrito?opc=6" class="btn btn-success">Grabar factura</a>&nbsp;&nbsp;&nbsp;
        <a href="control?opc=7" class="btn btn-success">Cancelar la compra</a>&nbsp;&nbsp;&nbsp;<br><br>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<td>Descripcion<th>Precio<th>Cantidad<th>Total
            </thead>
            <%
               double acu = 0;

    if (lista != null) {
        for (compra x : lista) {
            acu = acu + x.total();
            out.print("<tr><td>" + x.getId() + "<td>" + x.getNombre() + "<td>" + x.getPrecio() + "<td>" + x.getCantidad() + "<td>" + x.total());
        }
    }
            %>
            

            <tr><td><b>Total de Compra:</b><td><td><td><td><%=acu%>
        </table>
    </center>  
        <footer>
        <div id="footer">
            <div class="contenedor">
                <a href="index.jsp"><img src="Imagenes/te.png" alt="logo"></a>
                <h2>UTPhone | Telefonos</h2>
                <div class="footer-social">
                    <a href="contactanos.jsp"><img src="Imagenes/tecnico.png"></a>
                    <h5 class="copy">UTPhone © - DESIGNED BY alumnos de la UTP</h5>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>