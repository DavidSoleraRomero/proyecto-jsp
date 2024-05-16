<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="connectiontodb.ConnectionPool"%>
<%@page import="modules.Utilities"%>
<%@page import="employee.Employee"%>
<%@page import="employee.EmployeeService"%>
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
    <title>Manipulation</title>
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        String inputs = "";
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");
        else if (action == null)
            response.sendRedirect("home.jsp");
        else {

            if (action.equals("modify")) {

                long id = Long.parseLong(request.getParameter("employeeid"));
                String accessUser = "davidsr";
                String accessPassword = "123456789";
                String accessDbUrl = "jdbc:mysql://localhost:3306/empresa";
                ConnectionPool cp = new ConnectionPool(accessDbUrl, accessUser, accessPassword);
                EmployeeService es = new EmployeeService(cp.getConnection());

                Employee employeeToModify = es.requestById(id);
                if (employeeToModify == null)
                    response.sendRedirect("home.jsp");

                inputs = Utilities.createModifyInput(employeeToModify);

            } else 

                inputs = Utilities.createInsertInput();

        }

    %>

    <%= inputs %>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>