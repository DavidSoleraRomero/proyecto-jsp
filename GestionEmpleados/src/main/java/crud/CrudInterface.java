package crud;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CrudInterface<T> {

    /*
     * Returns the element that contains the provided id
     */
    public T requestById(long id) throws SQLException;

    /*
     * Returns all existing elements on the table
     */
    public ArrayList<T> requestAll(String sortedBy) throws SQLException;

    /*
     * Return all elements that matches the provided values on the provided column
     */
    public ArrayList<T> searchByColumn(String column, String value) throws SQLException;

    /*
     * Return all elements that matches the provided values on the provided column
     */
    public ArrayList<T> searchByColumn(String column, long value) throws SQLException;

    /*
     * Deletes the element that contains the provided id
     */
    public boolean delete(long id) throws SQLException;

    /*
     * Updates the element that matches the provided element id
     */
    public int update(T t) throws SQLException;

    /*
     * Creates a new element in the table
     */
    public long insert(T t) throws SQLException;

}
