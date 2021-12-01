
<%@page import="java.util.List"%>
<%@page import="Control.Acciones"%>
<%@page import="Modelo.*"%>
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
    
    usuario usu = (usuario )sesion.getAttribute("usuario");
    List<tarea> lista = Acciones.ListTareas(usu.getId_usu());
    int completadas = 0;
    int pendientes = 0;
    
    for(tarea tareas: lista){
        if(tareas.getEstado() == 0){
            pendientes++;
        }else if(tareas.getEstado()== 1){
            completadas++;
        }
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
    <title>Agenda</title>
</head>
<body>
    <div class="blanco">
        <center class="centrar">
            <p class="inicio">¡Hola <%=usu.getNom_usu() %>! Bienvenidx, estas son tus tareas agregadas</p>
            <p class="agenda">Tareas pendientes: <%=pendientes %></p>
            <p class="agenda">Actividades</p>
            <p class="agenda">Tareas completadas: <%=completadas %></p>
            <a href="agregar.jsp"><button class="sesion">Agregar actividades</button></a>
            <a href="consultar.jsp"><button class="sesion">Consultar actividades</button></a>
        </center>
        <hr>
    </div>
    <center class="centrar">
        <a href="CerrarSesion"><button class="volver">Cerrar Sesion</button></a>
    </center>
</body>
</html>
