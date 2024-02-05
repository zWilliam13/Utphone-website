<%-- 
    Document   : pagDash
    Created on : 7 oct. 2023, 11:26:01
    Author     : César
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*, modelo.*"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>UTPhone | Producto</title>
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
    <script src="js/filtrar.js" type="text/javascript"></script>
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
                <a class="dahboard-menu1" href="pagDash.jsp">
                  <img alt="MenuDashboardI188" src="imgPag/menudashboardi188-rb7.svg"/>
                  <span class="dahboard-text145 ParagraphBody">Dashboard Productos</span>
                  <img alt="Rectangle5I188" src="imgPag/rectangle5i188-omya-200w.png"
                    class="dahboard-rectangle"/>
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
                  <a class="dahboard-menu2" href="productos.jsp">
                    <i  style="color: #fff" class="material-symbols-outlined">shopping_bag</i>
                    <span class="dahboard-text153 ParagraphBody">Ir a comprar</span>  
                  </a>
                </div>
              </div>
            </div>
              <div class="dahboard-logout" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                <a   href="index.html">
                <img alt="Logout1156" src="imgPag/logout1156-tflgm.svg"/>
                </a>
              </div>
          </div>
             <%
                            DAOgraf obj=new DAOgraf();
                            String label="",data="";
                            for(categoria x:obj.lisCatePro()){
                            label += "'"+x.getNombre()+"',";
                            data += x.getId()+",";
                             }
                             if(obj.lisCatePro().size()>0){
                             label=label.substring(0, label.length()-1);
                             data=data.substring(0, data.length()-1);
                          }
                       %>
          <div class="frame40251-live-car-status">
                <div class="frame40251-live-car-status1">
                  <div class="frame40251-header1">
                    <div class="frame40251-frame40248">
                      <div class="table_header">
                        <span class="frame40251-text014 HeaderH1">
                          <span>Productos</span>
                        </span>
                        <div class="input_search">
                            <input type="search" placeholder="Buscar..." name="txtnom" id="txtnom">
                          <i  class="material-symbols-outlined">search</i>
                        </div>
                          <a href="pagIngresoProductos.jsp"><button>Crear nuevo</button></a>                        
                        
                      </div>
                      
                    </div>
                      <div id="tablares" name="tablares" class="frame40251-frame40248">
                      
                   </div>
                      <div style="width: 80%">
                      <center>
                          <h2>Productos por categoría</h2>
                          <br>
                          <div style="width: 60%; float: left">
                            <canvas id="myChart"></canvas>
                        </div>
                          <div style="width: 40%; float: right">
                            <table style="font-size: 12px">
                                <thead>
                                    <th># Productos
                                    <th>Categoría
                                </thead>
                                <%
                                for (categoria c : obj.lisCatePro()) {
                                %>
                                <tr><td><%=c.getId()%>
                                    <td><%=c.getNombre()%>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                          </center>
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
      type: "pie",
      data: {
        labels: [<%=label%> ],
        datasets: [
          {
            label: "Productos por categoría",
            data: [<%=data%>],
            backgroundColor: ["rgba(168,221,1,0.6)","rgba(135,210,15,0.6)","rgba(175,202,1,0.6)"],
          },
          
        ],
      },
    });
  </script>
</html>
