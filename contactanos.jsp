<%-- 
    Document   : contactanos
    Created on : 12 oct. 2023, 14:17:55
    Author     : maxed
--%>

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
        <link href="CSS/contactanos.css" rel="stylesheet" type="text/css"/>
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
                    <p>Telefonos</p>
                    <a class="cotenedor-boton" href="productos.jsp">Ver Nuestros Productos</a>
                </div>
            </section>
            <section class="content">
                <div class="cuerpo-contact">
                    <div class="formulario-contact">
                        <p class="requeridos" style="color: red;"> <span>(*</span> campos requeridos)</p><br>
                        <h4 class="Escribenos">Escríbenos, estamos aquí para ayudarte:</h4><br>
                        <form>
                            <p>
                                <label><i class="fa-sharp fa-solid fa-user"></i> Nombres: <span style="color: red;">*</span></label>
                                <input type="text" name="input-nombre" >
                            </p>
                            <p>
                                <label><i class="fa-sharp fa-solid fa-user"></i> Apellidos: <span style="color: red;">*</span></label>
                                <input type="text" name="input-apellidos" >
                            </p>
                            <p>
                                <label><i class="fa-regular fa-address-card"></i> DNI: <span style="color: red;">*</span></label>
                                <input type="text" name="input-dni" maxlength="8" >
                            </p>
                            <p>
                                <label><i class="fa-solid fa-at"></i> Email: <span style="color: red;">*</span></label>
                                <input type="email" name="input-email" >
                            </p>	
                            <p>
                                <label><i class="fa-sharp fa-solid fa-phone"></i> Teléfono:</label>
                                <input type="tel" name="input-telefono" >
                            </p>
                            <p>
                                <label for="Asunto"><i class="fa-solid fa-paperclip"></i> Asunto: <span style="color: red;">*</span></label>
                                <select id="Asunto">
                                    <option value="0">Seleccione Asunto</option>
                                    <option value="Reclamo"> Reclamo</option>
                                    <option value="Sugerencia">Sugerencia</option>
                                    <option value="Ventas Corporativas">Ventas Corporativas</option>
                                </select>
                            </p>
                            <p class="block">
                                <label><i class="fa-regular fa-envelope"></i> Mensaje: <span style="color: red;">*</span></label>

                                <textarea name="mensaje" rows="10"></textarea>
                            </p>
                            <p>
                                <label><i class="fa-solid fa-circle-exclamation"></i> Al completar el formulario estaría aceptando:</label><br><br>
                                <label><i class="fa-regular fa-square-check"></i> Los Términos y Condiciones de UTPhone.</label><br>
                                <label><i class="fa-regular fa-square-check"></i> Las Políticas de Privacidad de UTPhone.</label><br>
                                <label><i class="fa-regular fa-square-check"></i> El uso de sus datos personales para fines publicitarios.</label><br>
                            </p>
                            <p class="block">
                                <button type="submit">
                                    Enviar
                                </button>
                            </p>

                        </form>	

                    </div>
                    <div class="informacion-contact">
                        <div class="contenedor">
                            <h2>Comunicate con nosotros</h2>
                            <ul>
                                <li><i class="fa-brands fa-whatsapp"></i> : +51 948 086 952</li>
                                <li><i class="fa-solid fa-envelope"></i> : utphone@utp.edu.pe</li>
                                <li><i class="fa-solid fa-phone"></i> : (01)-365412</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section id="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.670748908121!2d-77.03945632581066!3d-12.06616004226038!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8ea52a218f9%3A0x4931f570fd313227!2sUTP%20-%20Torre%20Arequipa!5e0!3m2!1ses!2spe!4v1697404979037!5m2!1ses!2spe" width="100%" height="700px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
