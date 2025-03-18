<%@ page language="java" contentType="text/html; charset=UTF-8" import="shop.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Página de comprobación</title>
</head>

<body>
    <% 
        DBAccess conn=DBAccess.getInstance(); 
        boolean res=conn.checkConnection(); 
    %>
        <h1>
            <%=res%>
        </h1>
</body>

</html>