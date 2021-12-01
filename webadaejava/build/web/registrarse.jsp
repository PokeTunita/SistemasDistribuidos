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
    <title>Crear usuario</title>
</head>
<body>
    <div class="blanco">
        <center class="centrar">
            <form name="registrar" action="Registrar">
                <p class="inicio">Cree su usuario de ADAE</p>
                <p class="ingresar">Ingrese su nombre de usuario</p>
                <input type="text" name="nom" class="datos" placeholder="Nombre de usuario">
                <p class="ingresar">Ingrese su contraseña</p>
                <input type="password" name="pass" class="datos" placeholder="Contraseña">
                <p class="ingresar">Confirme su contraseña</p>
                <input type="password" name="confpass"  class="datos" placeholder="Confirmar constraseña">
                <br>
                <a><button type="button" onclick="registrarse()" class="sesion">Crear usuario</button></a>
            </form>
        </center>
        <p class="cambiar">¿Ya tienes un usuario? Ve a <a href="index.jsp">iniciar sesión</a></p>
        <hr>
    </div>
    <script src="./js/validar.js"> </script>
</body>
</html>
