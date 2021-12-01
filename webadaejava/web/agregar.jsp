<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>
 <% 
    HttpSession sesion = request.getSession(true);
    if(sesion.getAttribute("usuario") == null){
        %> 
        <jsp:forward page="index.jsp">
            <jsp:param name="Error" value="Es obligatorio identificarse" />
         </jsp:forward>
        <%
    }
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bonito.css">
    <link rel="stylesheet" href="css/divs.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Agregar actividades</title>
</head>
<body>
    <div class="blanquito">
        <center class="centrar">
            <form name="tarea" action="AgregarTarea">
            <p class="inicio">Agregar actividades</p>
            <p class="ingresar">Escriba el nombre de la actividad que desea agregar</p>
            <input type="text"  name="nombre" class="datos" placeholder="Nombre de actividad">
            <p class="ingresar">Elija la materia de la actividad</p>
            <select name="materia">
                <option value="1" >Cálculo integral</option>
                <option value="2">Física III</option>
                <option value="3">Química III</option>
                <option value="4">Inglés V</option>
                <option value="5">Orientación juvenil y profesional III</option>
                <option value="6">Introducción a los sistemas distribuidos</option>
                <option value="7">Introducción a la ingeniería de pruebas</option>
                <option value="8">Seguridad web y aplicaciones</option>
                <option value="9">Laboratorio de proyectos de tecnologías de la información III</option>
                <option value="10">Automatización de pruebas</option>
            </select>
            <p class="ingresar" >Fecha de entrega</p>
            <input type="date" name="fecha" class="fecha">
            <br>
            <a><button type="button" onclick="agregartarea()" class="sesion">Agregar Actividad</button></a>
            <a><button type="button" class="sesion">Consultar Actividades</button></a>
            </form>
        </center>
        <hr>
    </div>
    <center class="centrar">
        <a href="agenda.jsp"><button class="volver">Volver</button></a>
    </center>
    <script src="./js/validar.js"> </script>
</body>
</html>