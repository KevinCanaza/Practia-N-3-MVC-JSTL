<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Categoria"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%
    Libro lib = (Libro) request.getAttribute("lib");
    List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
    String tipo = (String) request.getAttribute("tipo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= (tipo == "new") ? "Nuevo" : "Editar"%>Libro</h1>
        <form action="LibroController" method="post">
            <input type="hidden" name="tipo" value="<%=tipo%>"/>
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<%=lib.getId()%>" readonly /></td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="<%=lib.getTitulo()%>"/></td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" value="<%=lib.getAutor()%>"/></td>
                </tr>
                <tr>
                    <td>Disponible</td>
                    <td><input type="text" name="disponible" value="<%=lib.getDisponible()%>"/></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><select name="idcat">
                        <%
                            for(Categoria c : categorias){
                        %>
                        <option value="<%= c.getId() %>" ${c.getId() == lib.getCate().getId()}? "selected": "">
                            <%= c.getDescripcion()%>
                        </option>
                        <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
