<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="connectiontodb.ConnectionPool"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Enlace de estilo propio -->
    <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
    <!-- Enlace a Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./assets/img/logo-favicon.png">
    <title>Login</title>
</head>
<body class="h-100 pt-5">

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser != null) 
            response.sendRedirect("home.jsp");

        String error = String.valueOf((session.getAttribute("error") != null) ? session.getAttribute("error") : "");

        if (error.contains("ya existe")) {
            session.setAttribute("error", null);
            error = "";
        }

    %>

    <div class="container pt-4">
        <form method="POST" action="authlogin.jsp" class="w-perso m-auto p-3 py-4 d-flex justify-content-center align-items-center flex-column custom-border border-dark rounded">
            <img class="w-25" src="./assets/img/logo-favicon.png" alt="Web logo">
            <h1 class="text-center">Inicio de sesión</h1>
            <div class="mt-3 w-100">
                <label for="username">Usuario</label>
                <input type="text" name="username" required class="form-control" name="username">
            </div>
            <div class="my-3 w-100">
                <label for="password">Contraseña</label>
                <input type="password" name="password" required class="form-control" name="password">
            </div>
            <%= error %>
            <a href="register.jsp" class="text-center text-dark">¿No tienes una cuenta? Regístrese aquí</a>
            <button type="submit" class="btn btn-dark mb-1 mt-3">INICIAR SESIÓN</button>
        </form>
    </div>

</body>