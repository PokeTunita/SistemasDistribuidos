<%@page import="java.util.List"%>
<%@page import="Modelo.tarea"%>
<%@page import="Modelo.tarea"%>
<%@page import="Control.Acciones"%>
<%@page import="Modelo.usuario"%>
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
    <title>Consultar actividades</title>
</head>
<body>
    <% 
        for(tarea tarea:lista){
            if(tarea.getEstado() == 0){
    %>
    <div class="consultas">
        <center class="centrar">
            <p class="inicio"><%=tarea.getDes_tarea() %></p>
            <p class="agenda">Pendiente</p>
            <p class="agenda"><%=tarea.getDes_mate() %></p>
            <p class="agenda">Fecha límite: <%=tarea.getFecha()%></p>
            <button class="sesion" type="button" onclick="location.href = 'Completada?id=<%=tarea.getId_tareas() %>'">Completada</button>
            <button class="sesion" type="button" onclick="location.href = 'EliminarTarea?id=<%=tarea.getId_tareas() %>'">Eliminar</button>
        </center>
        <hr>
    </div>
    <% 
        }else if(tarea.getEstado() == 1){
    %>
    <div class="consultas">
        <center class="centrar">
            <p class="inicio"><%=tarea.getDes_tarea() %></p>
            <p class="agenda">Completada</p>
            <p class="agenda"><%=tarea.getDes_mate() %></p>
            <p class="agenda">Fecha límite: <%=tarea.getFecha()%></p>
            <button class="sesion" type="button" onclick="location.href = 'Pendiente?id=<%=tarea.getId_tareas() %>'" >No completada</button>
            <button class="sesion" type="button" onclick="location.href = 'EliminarTarea?id=<%=tarea.getId_tareas() %>'">Eliminar</button>
        </center>
        </center>
        <hr>
    </div>
    <% }

        }
    
    %>
    <div>
        <center class="centrar">
            <a href="agenda.jsp"><button class="volver">Volver</button></a>
        </center>
    </div>
</body>
</html>
