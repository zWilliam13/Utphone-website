<%-- 
    Document   : pagDash
    Created on : 7 oct. 2023, 11:26:01
    Author     : César
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*, modelo.*"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>UTPhone | Ventas</title>
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
    <link href="CSS/style_1.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/filtrarVentas.js" type="text/javascript"></script>
    <script src="js/Chart.min.js" type="text/javascript"></script>
    <link rel="icon" href="imgPag/ico1.png"/>
  </head>
  <body>
      <div class="container">
        <div class="row">
          <div class="menu" style="overflow: scroll">
            <div class="cont-logo">
              <a class="logo" href="index_1.jsp">
                  <span class="iLogo" style="font-size: 20px;">UTPhone</span>
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
                <a class="dahboard-menu1" href="pagDashVentas.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Ventas</span>
                  <img alt="Rectangle5I188" src="imgPag/rectangle5i188-omya-200w.png"
                    class="dahboard-rectangle"/>
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
                    <img alt="MenuCarI188" src="Imagenes/icons8-product-24.png" class="dahboard-menu-dashboard"/>
                  <span class="dahboard-text143 ParagraphBody">Producto</span>
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
                  
                  <a class="dahboard-menu2" href="Controlador_Admin?accion=accion">
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
                      <%
                            DAOgraf obj=new DAOgraf();
                            String label="",data="";
                            for(ventas x:obj.lisVentasAn()){
                            label += "'"+x.getMes()+"',";
                            data += x.getCantidad()+",";
                             }
                             if(obj.lisVentasAn().size()>0){
                             label=label.substring(0, label.length()-1);
                             data=data.substring(0, data.length()-1);
                          }
                       %>
                    <div class="frame40251-frame40248">
                      <h2 style="text-align: center">Cantidad de ventas por año</h2>
                        <br>
                        <center>
                        <div style="display: inline-block; align-items: center">
                        <div style="width: 80%; float: left">
                            <canvas id="myChart"></canvas>
                        </div>
                        <div style="width: 20%; float: right">
                            <table style="font-size: 12px">
                                <thead>
                                    <th>Año
                                    <th># Ventas
                                    <th>Total
                                </thead>
                                <%
                                for (ventas v : obj.lisVentasAn()) {
                                %>
                                <tr><td><%=v.getMes()%>
                                    <td><%=v.getCantidad()%>
                                    <td><%=v.getTotal()%>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                        </center>
                            </div>
                        <br>
                        <br>
                        <div class="table_header">
                        <div class="input_search">
                            <h2 style="text-align: center">Cantidad de ventas por mes</h2>
                            <br>
                            <label>Filtro por año</label>
                            <select name="txtnom" id="txtnom" style="background-color: gray">
                                <%
                                for (ventas c : obj.lisFecha()) {
                                out.println("<option value='"+c.getMes()+"'>"+c.getMes());
                                }
                                out.println("<option value=''>"+"Listar Todo");
                                %>
                            </select>
                          <i  class="material-symbols-outlined">search</i>
                        </div>                  
                      </div>
                            <br>
                    </div>
                            <div style="float: right" id="tablares" name="tablares" class="frame40251-frame40248">
                      
                   </div>                 
                        
                  </div>
                </div>
          </div>
          
        </div>
      </div>
    </div>
  </body>
  <script>
    var ctx = document.getElementById("myChart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: [<%=label%> ],
        datasets: [
          {
            label: "Ventas por Mes",
            data: [<%=data%>],
            backgroundColor: "rgba(153,205,1,0.6)",
          },
          
        ],
      },
    });
  </script>
</html>
