<%-- 
    Document   : regAdmin
    Created on : 6 oct. 2023, 14:20:13
    Author     : César
--%>

<%@page import="modelo.administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>UTPhone | Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />
    <link href="CSS/dahboard3.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/frame40251.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/dahboard1.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" data-tag="font" />
    <link rel="stylesheet" href="CSS/style_1.css" />
    <link rel="icon" href="imgPag/ico1.png"/>
  </head>
  <%
      boolean cambia = false;
      administrador a = null;
      if (request.getAttribute("dato")!=null) {
              a = (administrador)request.getAttribute("dato");
              cambia = true;
          }
  %>
  
  <body>
      <div class="container">
        <div class="row">
          <div class="menu" style="overflow: scroll">
              <div class="cont-logo">
              <a class="logo" href="Inicio_Administrador.php">
                  <span class="iLogo" style="font-size: 20px; text-align: center">UTPhone</span>
              </a>
            </div>
            <div class="dahboard-menuitem">
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
                <a class="dahboard-menu2" href="pagDashLocal.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Local</span>
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
                <a class="dahboard-menu1" href="regAdmin.jsp">
                    <img alt="VectorI188" src="imgPag/adminIco.png"/>
                  <span class="dahboard-text147 ParagraphBody">Administrador</span>
                  <img alt="Rectangle5I188" src="imgPag/rectangle5i188-omya-200w.png"
                class="dahboard-rectangle" />
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
                <div class="dahboard-header8" style="padding:0px 16px; gap: 10px;">
                  <span class="dahboard-text149">Reporte</span>
                </div>
                <div class="dahboard-frame40245">
                
                <a class="dahboard-menu2" href="index.php">
                  <i  style="color: #fff" class="material-symbols-outlined">shopping_bag</i>
                  <span class="dahboard-text153 ParagraphBody">Ir a comprar</span>  
                </a>
              </div>
            </div>
            </div>
              <div class="dahboard-logout" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <a   href="includes\Admin_LogOut.php">
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
                            <%
                            if (cambia) {
                                    out.print("<span>Editar administrador con usuario: </span>"+a.getId());
                                } else {
                                    out.print("<span>Crear Nuevo Administrador</span>");
                                }
                            %>
                        </span>
                    </div>
                      
                    <div class="frame40251-frame40248">
                    <form action="controlAdmin">
                        <div class="signinformwhite-input">
                          <div style="display:flex; flex-direction: column; margin-top: 10px;">
                            <span>
                              <span>Nombre</span>
                            </span>
                              <%
                              if (cambia) {
                                     out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='nombre' placeholder='Ingrese sus nombres...' value='"+a.getNombre()+"' required/>");
                                  } else {
                                     out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='nombre' placeholder='Ingrese sus nombres...' required/>");
                                  }
                              %>
                          </div>
                          <div style="display:flex; flex-direction: column; margin-top: 10px;">
                            <span>
                              <span>Teléfono</span>
                            </span>
                              <%
                                  if (cambia) {
                                        out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='tele' value='"+a.getTelefono()+"' placeholder='#########' required/>");
                                      } else {
                                        out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='tele' placeholder='#########' required/>");
                                  }
                              %>
                          </div>
                          <div style="display:flex; flex-direction: column; margin-top: 10px;">
                            <span>
                              <span>Correo Electrónico</span>
                            </span>
                              <%
                              if (cambia) {
                                      out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='correo' value='"+a.getCorreo()+"' placeholder='name@company.com' required/>");
                                  } else {
                                  out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;' type='text' name='correo' placeholder='name@company.com' required/>");
                                  }
                              %>
                          </div>
                          <%
                          if (cambia) {
                               out.println("<input type='text' name='id' value='"+a.getId()+"' hidden/>");   
                              } else {
                          out.println("<div style='display:flex; flex-direction: column; margin-top: 10px;'>");
                          out.println("<span>");
                          out.println("<span>Usuario</span>");
                          out.println("</span>");
                          out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px; type='text' name='user' placeholder='Ingrese su nombre de usuario...' required/>");
                          out.println("</div>");
                          out.println("<div style='display:flex; flex-direction: column; margin-top: 10px;'>");
                          out.println("<span>");
                          out.println("<span>Contraseña</span>");
                          out.println("</span>");
                          out.println("<input style='border: 1px solid rgba(0,0,0,0.2); border-radius: 10px; padding: 10px; margin: 10px 0;font-size:14px;'"+
                                   "type='password' name='pass' placeholder='********' required/>");
                          out.println("</div>");
                          }
                          %>
                            <button class="button signinformwhite-buttons">
                            <span class="signinformwhite-text14">
                                <%
                                if (cambia) {
                                out.println("<input type='hidden' name='opc' value='4'>");
                                out.println("<input type='submit' class='signinformwhite-text14' value='Confirmar cambios' style='background: none;'>");
                                    } else {
                                    out.println("<input type='hidden' name='opc' value='1'>");
                                    out.println("<input type='submit' class='signinformwhite-text14' value='Registrar' style='background: none;'>");
                                    }
                                %>
                            </span>
                            </button>
                            </div>
                    </form>
                </div>
          </div>
          
        </div>
      </div>
    </div>
  </body>
</html>