
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="CSS/estilo_login.css">
    <title>Login</title>
</head>
<body class="body_login">
        <%
            String men="";
            HttpSession ses=request.getSession();
            int nro=0;
            if(ses.getAttribute("resp")!=null){
                nro=(Integer) ses.getAttribute("resp");
                if(nro==1) men="Usuario no existe";
                else men="Clave incorrecta";
            }
        %>
    <div class="login-container">
        <div class="login">
            <a href="index.jsp" class="bar2">
                <p>inicio</p>
            </a>
            
            <h1>Login</h1>
            <h2>Ingresa tus datos para verificar el inicio de sesión en tu cuenta.</h2>
            <h2><%=men%></h2>
            <form action="controlLogin" method="post">
                <input type="text"          name="iduser"       placeholder="Id de Usuario">
                
                <div class="input-password">
                    <input type="password"  name="contrasena"   placeholder="Contraseña" id="password">
                    <img src="Imagenes/login/ojo-ocultar.png" class="icon-ojo" id="eyeicon">
                </div>
                <script src="js/scripts_login.js"></script>
                
                <p>¿Haz olvidado tu contraseña?
                    <a style="color:black; font-weight: 600; padding-left: 10px" href="#">Entra aquí</a>
                </p>
                
                <button class="btn-login" type="submit" name="opc" value="6">
                    Iniciar Sesión
                </button>
                </form>
        </div>
        <div class="footer-info">
            copyright &copy;2023 | Politica de privacidad
        </div>
    </div>
</body>
</html>