<%-- 
    Document   : productos
    Created on : 12 oct. 2023, 14:17:42
    Author     : maxed
--%>

<%@page import="modelo.categoria"%>
<%@page import="DAO.negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UTPhone | Productos</title>
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
        <%
            negocio obj = new negocio();
        %>
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
            <section id="categoria">
                <div class="contenedor">
                    <div class="contenedor">
                        <div class="row">
                            <%
                                for (categoria x : obj.listCat()) {
                            %>
                            <div class="col-md-6 col-lg-3">
                                <div class="card mb-4">
                                    <a href="controlCarrito?opc=1&categoria=<%=x.getId()%>"> <!-- Agrega un enlace con el nombre de la categoría como parámetro -->
                                        <img src="<%=x.getImagen()%>" class="card-img-top" alt="<%=x.getNombre()%>"
                                             style="max-width: 300px; max-height: 250px;">
                                        <div class="card-body">
                                            <h3 class="card-title card-title-custom"><%=x.getNombre()%></h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>

                </div>
            </section>

        </main>
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
