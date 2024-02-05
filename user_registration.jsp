
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="CSS/estilo_login.css">
    <title>Cliente | Registro</title>
</head>
<body class="body_login">
    <div class="login-container">
        <div class="login">
            <a href="index.jsp" class="bar2">
                <p>inicio</p>
            </a>
            <h1>Registro Cliente</h1>
            <form action="controlLogin" method="post">

                <input type="text" name="nombre_usuario" placeholder="Nombre de usuario" required>
                <input type="text" name="ap_paterno" placeholder="Apellido Paterno" required>
                <input type="text" name="ap_materno" placeholder="Apellido Materno">
                <input type="email" name="correo" placeholder="Correo electrónico" required>
                <input type="text" name="telefono" placeholder="Teléfono" required>
                <input type="text" name="idusuario" placeholder="id Usuario" required>
                <input type="password" name="contrasena" placeholder="Contraseña" required>
                
                <label for="tipo_docu">Tipo de documento:</label>
                <select class="select-css" name="tipo_docu">
                    <option value="1">DNI</option>
                    <option value="2">Pasaporte</option>
                    <option value="3">Carné de extranjería</option>
                </select>
                <input type="text" name="num_docu" placeholder="Número de documento" required>

                <button class="btn-login" type="submit" name="opc" value="2">Registrar</button>
            </form>
            <script src="js/scripts_registration.js"></script>
            <a href="user_login.jsp">¿Ya tienes una cuenta?</a>
        </div>
    </div>
</body>
</html>