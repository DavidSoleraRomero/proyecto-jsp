<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
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
    <title>Register</title>
</head>
<body class="h-100 pt-5">

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser != null) 
            response.sendRedirect("home.jsp");

        // Obtiene error de validación de credenciales
        String error = (request.getParameter("error") != null) ? request.getParameter("error") : "";
        
        // Obtiene error de usuario existente si no hay error de credenciales
        if (error.equals(""))
            error = String.valueOf((session.getAttribute("error") != null) ? session.getAttribute("error") : error);

        if (error.contains("inválidos")) {
            session.setAttribute("error", null);
            error = "";
        }

    %>

    <div class="container pt-4">
        <form method="POST"
        class="w-perso m-auto p-3 py-4 d-flex justify-content-center align-items-center flex-column custom-border border-dark rounded"
        id="registerForm">
            <img class="w-25" src="./assets/img/logo-favicon.png" alt="Web logo"> 
            <h1 class="text-center">Registro</h1>
            <div class="mt-3 w-100">
                <label for="username">Usuario</label>
                <input type="text" name="username" id="username" required class="form-control">
            </div>
            <div class="my-3 w-100">
                <label for="password">Contraseña</label>
                <input type="password" name="password" id="password" required class="form-control">
            </div>
            <%= error %>
            <a href="login.jsp" class="text-center text-dark">¿Ya tienes una cuenta? Inicie sesión aquí</a>
            <button type="submit" class="btn btn-dark mb-1 mt-3">REGISTRO</button>
        </form>
    </div>

    <script>
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            const usernamePattern = /^[a-zA-Z0-9]{4,15}$/;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){6,}$/;


            let valid = true;
            let message = '';

            if (!usernamePattern.test(username)) {
                valid = false;
                message += '<p class=\"text-center text-danger\">Usuario debe tener entre 4 y 15 caracteres con solo letras y numeros</p>';
            }

            if (!passwordPattern.test(password) && valid) {
                valid = false;
                message += '<p class=\"text-center text-danger\">Requisitos contrasena: sin espacios, min 6 caracteres, min 1 minuscula y mayuscula, min 1 caracter especial y min 1 digito</p>';
            }

            if (valid) {
                const encodedUsername = encodeURIComponent(username);
                const encodedPassword = encodeURIComponent(password);
                window.location.href = `registerindb.jsp?username=${encodedUsername}&password=${encodedPassword}`;
            } else {
                const encodedError = encodeURIComponent(message);
                window.location.href = `register.jsp?error=${encodedError}`;
            }
        });
    </script>
</body>