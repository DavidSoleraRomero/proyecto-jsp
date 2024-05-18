<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="user.User"%>
<%@page import="employee.EmployeeService"%>
<%@page import="connectiontodb.ConnectionPool"%>
<%@page import="java.util.ArrayList" %>
<%@page import="modules.Utilities"%>
<%@page import="modules.EmployeeUtilities"%>
<%@page import="employee.Employee" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Enlace de estilo propio -->
    <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
    <!-- Enlace a Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Enlace a FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./assets/img/logo-favicon.png">
    <title>Home</title>
</head>
<body>

    <% 
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User loggedUser = (User) session.getAttribute("user");
        if (loggedUser == null) 
            response.sendRedirect("login.jsp");
        session.setAttribute("error", null);
        String username = "<p id=\"userlogged\" class=\"m-0 pl-2\">" + ((loggedUser != null) ? loggedUser.getUsername() : "") + "</p>";

        String accessUser = "davidsr";
        String accessPassword = "123456789";
        String accessDbUrl = "jdbc:mysql://localhost:3306/empresa";
        ConnectionPool cp = new ConnectionPool(accessDbUrl, accessUser, accessPassword);
        EmployeeService es = new EmployeeService(cp.getConnection());

        String column = request.getParameter("column");
        String stringValue = request.getParameter("value");

        ArrayList<Employee> employees = null;
        Employee employee = null;

        if (column == null || column.equals("0")) 
            employees = es.requestAll("");
        else if (!column.equals("CodEmp")) {
            if (Utilities.isNumber(stringValue)) 
                employees = es.searchByColumn(column, Long.parseLong(stringValue));
            else 
                employees = es.searchByColumn(column, stringValue);
        } else 
            employee = es.requestById(Long.parseLong((Utilities.isNumber(stringValue) ? stringValue : "-1")));

    %>

    <div class="container p-0">

        <nav class="navbar bg-body-tertiary px-0 position-sticky top-0 bg-white border-bottom border-dark">
            <div class="container-fluid px-0 d-flex justify-content-between align-items-center">
                <div>
                    <a id="gemp" class="navbar-brand d-flex align-items-center text-dark m-0" href="home.jsp">
                        <img src="./assets/img/logo-favicon.png" alt="Home's favicon" class="d-inline-block align-text-top w-50px">
                        <p class="m-0 pr-2">Gestión Empleados</p>
                    </a>
                </div>
                <a id="nav-username" class="nav-link d-flex align-items-center text-dark p-0" href="loggeduser.jsp">
                    <%= username %>
                    <img class="w-50px border-end border-dark" src="./assets/img/UserIcon.png" alt="User's icon">
                </a>
            </div>
        </nav>

        <h1 class="pt-2">Buscador</h1>
        <form method="POST" action="home.jsp">
            <select name="column" required class="form-select w-25-perso">
                <option selected disabled value="0">Seleccione un campo de búsqueda</option>
                <option value="CodEmp">Identificador</option>
                <option value="NomEmp">Nombre</option>
                <option value="ApeEmp">Apellido</option>
                <option value="Cargo">Cargo</option>
            </select>
            <input type="text" class="my-2 mr-1 w-25-perso" required placeholder="Valor del campo" name="value">
            <button type="submit" class="btn btn-dark mb-1">BUSCAR</button>
            <a href="home.jsp" class="text-dark">QUITAR FILTROS</a>
        </form> 

        <form method="POST" action="manipulation.jsp">
            <input type="hidden" name="action" value="insert">
            <button type="submit" class="btn btn-dark mt-1">INSERTAR EMPLEADO</button>
        </form>

        <div class="container p-0 pt-1">
            <h1>Resultados - Tabla de EMPLEADOS</h1>
            <div class="row mb-5">
            <%= (employees != null) ? EmployeeUtilities.employeeHtmlString(employees) : EmployeeUtilities.employeeHtmlString(employee) %>
            </div>
        </div>

    </div>

</body>