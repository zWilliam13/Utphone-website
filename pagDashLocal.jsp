<%-- 
    Document   : pagDashAdmin
    Created on : 8 oct. 2023, 20:07:24
    Author     : César
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>UTPhone | Dashboard Local</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />
    <link href="CSS/dahboard3.css" rel="stylesheet" />
    <link href="CSS/frame40251.css" rel="stylesheet" />
    <link href="CSS/dahboard1.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="CSS/style_1.css" />
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/filtrarLocal.js" type="text/javascript"></script>
    <link rel="icon" href="imgPag/ico1.png"/>
  </head>
  <body>
      <div class="container">
        <div class="row">
            <div class="menu" style="overflow: scroll">
            <div class="cont-logo">
              <a class="logo" href="Inicio_Administrador.php">
                  <span  class="iLogo" style="font-size: 20px; text-align: center">UTPhone</span>
              </a>
            </div>
            <div class="dahboard-menuitem" >
              <div class="dahboard-menutop">
                <a class="dahboard-menu2" href="pagDash.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Productos</span>
                </a>
                <a class="dahboard-menu2" href="pagDashAdmin.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Administrador</span>
                </a>
                <a class="dahboard-menu2" href="pagDashEmpleado.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Empleados</span>
                </a>
                <a class="dahboard-menu1" href="pagDashLocal.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Local</span>
                  <img alt="Rectangle5I188" src="imgPag/rectangle5i188-omya-200w.png"
                    class="dahboard-rectangle"/>
                </a>
                <a class="dahboard-menu2" href="pagDashVentas.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Ventas</span>
                </a>
                <div class="splitline1"></div>
                <div class="dahboard-header8">
                  <span class="dahboard-text149">Registros</span>
                </div>
                <a class="dahboard-menu2" href="pagIngresoEmpleado.jsp">
                    <img alt="VectorI188" src="Imagenes/emp.png"/>
                  <span class="dahboard-text147 ParagraphBody">Empleados</span>
                </a>
            <a class="dahboard-menu2" href="regAdmin.jsp">
                    <img alt="VectorI188" src="imgPag/adminIco.png"/>
                  <span class="dahboard-text147 ParagraphBody">Administrador</span>
                </a>
                <a class="dahboard-menu2" href="pagIngresoProductos.jsp">
                    <img alt="VectorI188" src="Imagenes/icons8-product-24.png"/>
                  <span class="dahboard-text153 ParagraphBody">Producto</span>
                </a>
                <a class="dahboard-menu2" href="pagIngresoLocal.jsp">
                    <img alt="VectorI188" src="Imagenes/calendar-check.png"/>
                  <span class="dahboard-text147 ParagraphBody">Local</span>
                </a>
              </div>
              <div class="splitline1"></div>
              <div class="dahboard-frame40245">
                <div class="dahboard-header8" style="padding:0px 16px;gap: 10px;">
                
                </div>
                <div class="dahboard-frame40245">
                
                
                
                <a class="dahboard-menu2" href="index.html">
                  <i  style="color: #fff" class="material-symbols-outlined">shopping_bag</i>
                  <span class="dahboard-text153 ParagraphBody">Ir a comprar</span>  
                </a>
              </div>
            </div>
            </div>
            <div class="dahboard-logout" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <a   href="login_1.jsp">
                <img alt="Logout1156" src="imgPag/logout1156-tflgm.svg"/>
                </a>
              </div>
          </div>
          <div class="frame40251-live-car-status">
                <div class="frame40251-live-car-status1">
                  <div class="frame40251-header1">
                    <div class="frame40251-frame40248">
                      <div class="table_header">
                        <span class="frame40251-text014 HeaderH1">
                          <span>Locales de atención</span>
                        </span>
                        <section>
                          <div class="input_search">
                            <input type="text" name="txtnom" id="txtnom" value="" placeholder="Buscar por dirección...">
                            <i  class="material-symbols-outlined">search</i>
                          </div>
                        </section>
                        <a href="pagIngresoLocal.jsp"><button>Crear nuevo</button></a>
                      </div>
                    </div>
                    
                    <div class="frame40251-frame40248">
                    <section id="tablares">  
                    
                    
                    </section>
                    </div>

                  </div>
              </div>
          </div>
          
        </div>
      </div>
    </div>
  </body>
</html>
