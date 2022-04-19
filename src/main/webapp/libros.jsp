<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%
    ArrayList<Libro> libros = (ArrayList<Libro>)session.getAttribute("estante");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Libros</h1>
        <p><a href="LibroController?op=nuevo">Nuevo</a></p>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Titulo</th>
            <th>Autor</th> 
            <th>Disponible</th>
            <th>Categorias</th> 
            <th></th>
            <th></th> 
        </tr>
        <%
            if(libros != null){
                for(Libro item : libros){
        %>
        <tr>
            <td><%= item.getId()%></td>
            <td><%= item.getTitulo()%></td>
            <td><%= item.getAutor()%></td>
            <td><%= item.getDisponible()%></td>
            <td><%= item.getCate().getDescripcion()%></td>
            <td><a href="LibroController?op=editar&id=<%= item.getId()%>">Editar</a></td>
            <td><a href="LibroController?op=eliminar&id=<%= item.getId()%>">Eliminar</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <p> <a href="index.jsp">Ir al inicio</a></p>
    </body>
</html>
