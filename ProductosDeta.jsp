<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*, modelo.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UTPhone | Detalle</title>        
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
            producto prod = (producto) request.getAttribute("dato");
        %>

    <center>
        <h2>Detalle de Productos</h2>
        <a href="#" onclick="history.back()">Retornar</a><br><br>
        <form id="detalleForm" action="controlCarrito" method="post"> <!-- Añadido el método y corregida la etiqueta de cierre -->
            <table border="1" cellspacing="30" cellpadding="15">
                <input type="hidden" name="opc" value="4">
                <input type="hidden" name="cod" value="<%=prod.getId()%>">
                <tr>
                    <td rowspan="5"><img src="<%=prod.getImagen()%>" width="250" height="250"></td> <!-- Corregida la etiqueta de cierre -->
                    <td>Descripcion</td><td><%=prod.getNombre()%></td>
                </tr>
                <tr><td>Precio Unitario</td><td><%=prod.getPrecio()%></td></tr>
                <tr><td>Stock</td><td><%=prod.getStock()%></td></tr>
                <tr><td>Cantidad</td><td><input name="cantidad"></td></tr> <!-- Corregida la etiqueta de cierre -->
                <tr>
                    <td>
                        <a href="#" onclick="valida()">
                            <img src="Imagenes/ces.jpg" width="100" height="100">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td><a href="Imagenes/ces.jpg"></a></td>
                </tr>
            </table>
        </form> <!-- Corregida la etiqueta de cierre -->
    </center>
    <script>
        function valida() {
            sk = <%=prod.getStock()%>;
            can = Number(document.getElementById("detalleForm").cantidad.value);
            if (sk < can) {
                alert("Stock no disponible");
                return;
            }

            document.getElementById("detalleForm").submit();
        }
    </script> 
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
