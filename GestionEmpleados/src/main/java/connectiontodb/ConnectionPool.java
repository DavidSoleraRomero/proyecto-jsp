package connectiontodb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

public class ConnectionPool {

    private ArrayList<Connection> connections = new ArrayList<>();
    private String url;
    private String user;
    private String password;

    public ConnectionPool(String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(this.url, this.user, this.password);
            if (conn != null)
                this.connections.add(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void closeActiveConnections() {
        for (Connection connection : this.connections) {
            try {
                if (connection != null)
                    connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.connections.clear();
    }

}
