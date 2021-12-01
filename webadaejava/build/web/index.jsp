<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>
 <% 
    HttpSession sesion = request.getSession(true);
    if(sesion.getAttribute("usuario") != null){
       response.sendRedirect("agenda.jsp");
    }
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bonito.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Inicio de sesión</title>
</head>
<body>
    <div class="blanco">
        <center class="centrar">
            <form name="iniciar" action="Login">
                <p class="inicio">Bienvenidx a tu ADAE Web</p>
                <p class="ingresar">Ingrese su nombre de usuario</p>
                <input type="text" class="datos" name="nombre" placeholder="Nombre de usuario">
                <p class="ingresar">Escriba su contraseña</p>
                <input type="password" name="pass" class="datos" placeholder="Contraseña">
                <br>
                <a><button type="button" onclick="iniciars()" class="sesion">Iniciar sesión</button></a>
            </form>
        </center>
        <p class="cambiar">¿No tienes un usuario todavía? <a href="registrarse.jsp">Da click aquí</a> para registrarte</p>
        <hr>
    </div>
    <script src="./js/validar.js"> </script>
</body>
</html>
