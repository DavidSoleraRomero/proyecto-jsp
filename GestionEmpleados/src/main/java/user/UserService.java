package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import crud.CrudInterface;

public class UserService implements CrudInterface<User> {

    Connection conn;

    public UserService(Connection conn) {
        this.conn = conn;
    }

    @Override
    public User requestById(long id) throws SQLException {
        Statement statement = null;
        User ret = null;
        statement = this.conn.createStatement();
        String sql = String.format("SELECT CodUsu, NomUsu, ConUsu FROM usuario WHERE CodUsu = %d", id);
        ResultSet consulta = statement.executeQuery(sql);
        if (consulta.next()) {
            long userId = consulta.getLong("CodUsu");
            String username = consulta.getString("NomUsu");
            String password = consulta.getString("ConUsu");
            ret = new User(userId, username, password);
        }
        statement.close();
        return ret;
    }

    @Override
    public ArrayList<User> requestAll(String sortedBy) throws SQLException {
        ArrayList<User> result = new ArrayList<User>();
        Statement statement = this.conn.createStatement();
        String sql = "SELECT CodUsu, NomUsu FROM usuario"
                + (sortedBy.length() > 0 ? (" ORDER BY " + sortedBy) : "");
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long userId = querySet.getLong("CodUsu");
            String username = querySet.getString("NomUsu");
            result.add(new User(userId, username, ""));
        }
        statement.close();
        return result;
    }

    @Override
    public ArrayList<User> searchByColumn(String column, String value) throws SQLException {
        ArrayList<User> result = new ArrayList<User>();
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT CodUsu, NomUsu FROM usuario WHERE %s = '%s'", column, value);
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long userId = querySet.getLong("CodUsu");
            String username = querySet.getString("NomUsu");
            String password = querySet.getString("ConUsu");
            result.add(new User(userId, username, password));
        }
        statement.close();
        return result;
    }

    @Override
    public ArrayList<User> searchByColumn(String column, long value) throws SQLException {
        ArrayList<User> result = new ArrayList<User>();
        Statement statement = this.conn.createStatement();
        String sql = String.format("SELECT CodUsu, NomUsu FROM usuario WHERE %s = %d", column, value);
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long userId = querySet.getLong("CodUsu");
            String username = querySet.getString("NomUsu");
            String password = querySet.getString("ConUsu");
            result.add(new User(userId, username, password));
        }
        statement.close();
        return result;
    }

    @Override
    public boolean delete(long id) throws SQLException {
        Statement statement = this.conn.createStatement();
        String sql = String.format("DELETE FROM usuario WHERE id = %d", id);
        int affectedRows = statement.executeUpdate(sql);
        statement.close();
        return affectedRows == 1;
    }

    @Override
    public int update(User t) throws SQLException {
        long id = t.getId();
        String username = t.getUsername();
        String password = t.getPassword();
        Statement statement = this.conn.createStatement();
        String sql = String.format("UPDATE usuario SET NomUsu = '%s', ConUsu = '%s' WHERE CodUsu=%d",
                username, password, id);
        int affectedRows = statement.executeUpdate(sql);
        statement.close();
        if (affectedRows == 0)
            throw new SQLException("Updating user failed - 0 rows affected.");
        else
            return affectedRows;
    }

    @Override
    public long insert(User t) throws SQLException {
        String sql = String.format("INSERT INTO usuario (NomUsu, ConUsu) VALUES (?, ?)");
        PreparedStatement prepStatement = this.conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        prepStatement.setString(1, t.getUsername());
        prepStatement.setString(2, t.getPassword());
        int affectedRows = prepStatement.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("An error has occured inserting the new user");
        } else {
            ResultSet rs = prepStatement.getGeneratedKeys();
            if (rs.next()) {
                long id = rs.getLong(1);
                prepStatement.close();
                return id;
            } else {
                prepStatement.close();
                throw new SQLException("An error has occured inserting the new user");
            }
        }
    }

    public User validateCredentials(String us, String pa) throws SQLException {
        User validatedUser = null;
        String sql = String.format("SELECT * FROM usuario WHERE NomUsu = '%s' AND ConUsu = '%s'", us, pa);
        Statement statement = this.conn.createStatement();
        ResultSet querySet = statement.executeQuery(sql);
        while (querySet.next()) {
            long id = querySet.getLong(1);
            String username = querySet.getString(2);
            String password = querySet.getString(3);
            validatedUser = new User(id, username, password);
        }
        statement.close();
        return validatedUser;
    }

}
