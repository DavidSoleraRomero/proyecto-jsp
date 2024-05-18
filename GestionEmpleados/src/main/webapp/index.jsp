<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser != null) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    %>

</body>