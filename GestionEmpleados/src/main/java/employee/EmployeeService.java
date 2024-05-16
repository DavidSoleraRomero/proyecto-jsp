package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import crud.CrudInterface;

public class EmployeeService implements CrudInterface<Employee> {

    private Connection conn;

    public EmployeeService(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Employee requestById(long id) throws SQLException {
        Statement statement = null;
        Employee ret = null;
        statement = this.conn.createStatement();
        String sql = String.format("SELECT * FROM empleado WHERE CodEmp = %d", id);
        ResultSet querySet = statement.executeQuery(sql);
        if (querySet.next()) {
            long employeeId = querySet.getLong("CodEmp");
            String name = querySet.getString("NomEmp");
            String surnames = querySet.getString("ApeEmp");
            String charge = querySet.getString("Cargo");
            ret = new Employee(employeeId, name, surnames, charge);
        }
        statement.close();
        return ret;
    }

    @Override
    public ArrayList<Employee> requestAll(String sortedBy) throws SQLException {
        ArrayList<Employee> result = new ArrayList<Employee>();
        Statement statement = this.conn.createStatement();
        String sql = "SELECT * FROM empleado"
                + (sortedBy.length() > 0 ? (" ORDER BY " + sortedBy) : "");
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long employeeId = querySet.getLong("CodEmp");
            String name = querySet.getString("NomEmp");
            String surnames = querySet.getString("ApeEmp");
            String charge = querySet.getString("Cargo");
            result.add(new Employee(employeeId, name, surnames, charge));
        }
        statement.close();
        return result;
    }

    @Override
    public ArrayList<Employee> searchByColumn(String column, String value) throws SQLException {
        ArrayList<Employee> result = new ArrayList<Employee>();
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT * FROM empleado WHERE %s LIKE '%s'", column, ("%" + value + "%"));
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long employeeId = querySet.getLong("CodEmp");
            String name = querySet.getString("NomEmp");
            String surnames = querySet.getString("ApeEmp");
            String charge = querySet.getString("Cargo");
            result.add(new Employee(employeeId, name, surnames, charge));
        }
        statement.close();
        return result;
    }

    @Override
    public ArrayList<Employee> searchByColumn(String column, long value) throws SQLException {
        ArrayList<Employee> result = new ArrayList<Employee>();
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT * FROM empleado WHERE %s = %d", column, value);
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long employeeId = querySet.getLong("CodEmp");
            String name = querySet.getString("NomEmp");
            String surnames = querySet.getString("ApeEmp");
            String charge = querySet.getString("Cargo");
            result.add(new Employee(employeeId, name, surnames, charge));
        }
        statement.close();
        return result;
    }

    @Override
    public boolean delete(long id) throws SQLException {
        Statement statement = this.conn.createStatement();
        String sql = String.format("DELETE FROM empleado WHERE CodEmp = %d", id);
        int affectedRows = statement.executeUpdate(sql);
        statement.close();
        return affectedRows == 1;
    }

    @Override
    public int update(Employee t) throws SQLException {
        long id = t.getId();
        String name = t.getName();
        String surname = t.getSurname();
        String charge = t.getCharge();
        Statement statement = this.conn.createStatement();
        String sql = String.format(
                "UPDATE empleado SET NomEmp = '%s', ApeEmp = '%s', Cargo = '%s' WHERE CodEmp = %d",
                name, surname, charge, id);
        int affectedRows = statement.executeUpdate(sql);
        statement.close();
        if (affectedRows == 0)
            throw new SQLException("Updating employee failed - 0 rows affected.");
        else
            return affectedRows;
    }

    @Override
    public long insert(Employee t) throws SQLException {
        String sql = String.format("INSERT INTO empleado (NomEmp, ApeEmp, Cargo) VALUES (?, ?, ?)");
        PreparedStatement prepStatement = this.conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        prepStatement.setString(1, t.getName());
        prepStatement.setString(2, t.getSurname());
        prepStatement.setString(3, t.getCharge());
        int affectedRows = prepStatement.executeUpdate();
        if (affectedRows == 0)
            throw new SQLException("An error has occured inserting the new employee");
        else {
            ResultSet rs = prepStatement.getGeneratedKeys();
            if (rs.next()) {
                long id = rs.getLong(1);
                prepStatement.close();
                return id;
            } else {
                prepStatement.close();
                throw new SQLException("An error has occured inserting the new employee");
            }
        }
    }

}
