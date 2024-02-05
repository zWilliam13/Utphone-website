<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*, modelo.*"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UTPhone | Categorias</title>
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
        <main>
            <section id="banner">
                <div class="banner-img">
                    <img src="Imagenes/prod.jpg">
                </div>
                <div class="contenedor">
                    <h2>Nuestras Promociones</h2>
                </div>
            </section>
        </main>
        <%
            List<producto> listaProd = (ArrayList<producto>) request.getAttribute("dato");
        %>
    <center>
        <h2>Lista de Productos</h2>
        <a href="#" onclick="history.back()">Retornar</a><br><br>

        <table cellspacing="50" cellpadding="50">
            Size: <%= listaProd.size()%>
            <%
                int cuenta = 0;

                if (listaProd != null) {
                    for (producto x : listaProd) {
            %>
            <td onmouseover="bgColor = 'lightblue'" onmouseout="bgColor = 'white'">
                <a href="controlCarrito?opc=3&cod=<%=x.getId()%>">
                    <img src="<%=x.getImagen()%>" width="250" height="250"><br><%=x.getNombre()%>
                </a>
                <%
                            cuenta++;
                            if (cuenta % 3 == 0) {
                                out.print("</tr><tr>");
                            }
                        }
                    } else {
                        // Maneja la situación donde la lista es null
                        out.print("La lista de productos es nula.");
                    }
                %>

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
