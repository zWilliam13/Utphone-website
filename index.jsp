<%-- 
    Document   : index
    Created on : 12 oct. 2023, 12:51:26
    Author     : maxed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UTPhone | Inicio</title>
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
        <script src="https://kit.fontawesome.com/c01fb11645.js" crossorigin="anonymous"></script>
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
                        <li><a href="user_login.jsp">Login</a></li>
                        <li><a href="user_registration.jsp">Registrar</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <section id="banner">
                <div class="banner-img">
                    <img src="Imagenes/banner.jpg">
                </div>
                <div class="contenedor">
                    <h2>UTPhone</h2>
                    <p>Venta de Dispositivos Moviles en Linea</p>
                    <a class="cotenedor-boton" href="productos.jsp">Ver Nuestros Productos</a>
                </div>
            </section>
            <section id="meta">
                <div class="contenedor">
                    <h2>NUESTRA META</h2>
                    <div class="contenedor-linea"></div>
                    <p>
                        Ser la empresa líder y de referencia en la industria de la venta de dispositivos móviles en línea, comprometida con la excelencia en la experiencia de compra para nuestros 
                        clientes. Nuestra meta es ofrecer a los clientes una experiencia de compra en línea actualizada y accesible, permitiéndoles encontrar y adquirir 
                        dispositivos móviles de manera rápida y sencilla, y expandiendo constantemente nuestro catálogo para satisfacer sus necesidades individuales.
                    </p>
                    <img src="Imagenes/nuestra.jpg">
                    <a class="cotenedor-boton" href="nosotros.jsp">Conocenos un poco más</a>
                </div>
            </section>
            <section id="carta">
                <h2>NUESTROS PRODUCTOS</h2>
                <div class="contenedor-linea"></div>
                <div class="carta-iten">
                    <img src="Imagenes/1.jpeg">
                    <img src="Imagenes/2.jpeg">
                    <img src="Imagenes/3.jpeg">
                    <img src="Imagenes/4.jpeg">
                    <img src="Imagenes/5.jpeg">
                    <img src="Imagenes/6.jpeg">
                    <img src="Imagenes/7.jpeg">
                    <img src="Imagenes/8.jpeg">
                </div>
                <a class="cotenedor-boton" href="productos.jsp">Ver Productos</a>
            </section>
            <section id="staff">
                <div class="contenedor">
                    <h2>NUESTRO STAFF</h2>
                    <div class="contenedor-linea"></div>
                    <img src="Imagenes/staff.jpg">
                    <p>
                       En <strong>UTPhone</strong>, nuestra especialización se centra en la experiencia de compra en linea de dispositivos móviles. 
                       Nuestra prioridad indiscutible es la calidad, tanto en la selección de los mejores dispositivos moviles como en el area de soporte. 
                       Nuestro equipo de expertos ha trabajado incansablemente para desarrollar una pagina web que destaca por su funcionalidad y calidad.
                    </p>
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
