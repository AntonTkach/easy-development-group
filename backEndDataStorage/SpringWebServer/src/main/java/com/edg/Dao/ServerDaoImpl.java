package com.edg.Dao;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;

@Repository
public class ServerDaoImpl implements ServerDao {

    /**
     * Creates connection to specific database
     * @return Connection object
     */
    private Connection connect(String dbName) {
        // SQLite connection string
        String url = "jdbc:sqlite:" + dbName;
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }


    public JSONArray getAllUsers() {
        String sql = "SELECT * FROM Users";
        JSONArray arrayJsonResult = new JSONArray();

        try (Connection conn = this.connect("TODOpomodoro.db");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                JSONObject objJsonResult = new JSONObject();

                for (int i = 0; i < columnCount; i++) {

                    objJsonResult.put(rs.getMetaData().getColumnName(i + 1), rs.getString(i + 1));
                }
                arrayJsonResult.put(objJsonResult);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return arrayJsonResult;
        }
}
