package modules;

import employee.Employee;

/*
 * The Utilities class is a general class that helps the page's general functionality
 * Here you will found transformations from Java classes to Strings that JSP will print on HTML
 */

public class Utilities {

    public static boolean isNumber(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isDigit(s.charAt(i)))
                return false;
        }
        return true;
    }

    public static String createModifyInput(Employee e) {
        String ret = String.format(
                "<br><br><form method=\"POST\" action=\"domanipulation.jsp\" class=\"w-perso m-auto p-3 py-4 d-flex justify-content-center align-items-center flex-column custom-border border-dark rounded\">"
                        +
                        "<h1 class=\"text-center\">Modificación</h1>" +
                        "<div class=\"mt-3 w-100\">\n" +
                        "    <label for=\"employeeid\">ID de Empleado</label>\n" +
                        "    <input type=\"text\" value=\"%d\" name=\"employeeid\" readonly class=\"form-control\" id=\"employeeid\">\n"
                        +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"name\">Nombre</label>\n" +
                        "    <input type=\"text\" name=\"name\" value=\"%s\" class=\"form-control\" id=\"name\">\n" +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"surname\">Apellido</label>\n" +
                        "    <input type=\"text\" name=\"surname\" value=\"%s\" class=\"form-control\" id=\"surname\">\n"
                        +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"charge\">Cargo</label>\n" +
                        "    <input type=\"text\" name=\"charge\" value=\"%s\" class=\"form-control\" id=\"charge\">\n"
                        +
                        "</div>"
                        +
                        "<input type=\"hidden\" name=\"action\" value=\"modify\">"
                        +
                        "<div class=\"d-flex\">" +
                        "<button type=\"submit\" class=\"btn btn-dark\">MODIFICAR</button>" +
                        "<a href=\"home.jsp\" class=\"btn btn-danger ml-1\">CANCELAR</a>" +
                        "</div>"
                        + "</form>",
                e.getId(), e.getName(), e.getSurname(), e.getCharge());
        return ret;
    }

    public static String createInsertInput() {
        String ret = String.format(
                "<br><br><br><form method=\"POST\" action=\"domanipulation.jsp\" class=\"w-perso m-auto p-3 py-4 d-flex justify-content-center align-items-center flex-column custom-border border-dark rounded\">"
                        +
                        "<h1 class=\"text-center\">Inserción</h1>" +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"name\">Nombre</label>\n" +
                        "    <input type=\"text\" name=\"name\" class=\"form-control\" id=\"name\">\n" +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"surname\">Apellido</label>\n" +
                        "    <input type=\"text\" name=\"surname\" class=\"form-control\" id=\"surname\">\n"
                        +
                        "</div>\n" +
                        "<div class=\"my-3 w-100\">\n" +
                        "    <label for=\"charge\">Cargo</label>\n" +
                        "    <input type=\"text\" name=\"charge\" class=\"form-control\" id=\"charge\">\n"
                        +
                        "</div>"
                        +
                        "<input type=\"hidden\" name=\"action\" value=\"insert\">"
                        +
                        "<div class=\"d-flex my-1\">" +
                        "<button type=\"submit\" class=\"btn btn-dark\">INSERTAR</button>" +
                        "<a href=\"home.jsp\" class=\"btn btn-danger ml-1\">CANCELAR</a>" +
                        "</div>"
                        + "</form>");
        return ret;
    }

}
