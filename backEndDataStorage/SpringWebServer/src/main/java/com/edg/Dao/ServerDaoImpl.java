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
    private Connection connect() {
        // SQLite connection string
        String dbName = "TODOpomodoro.db";
        String url = "jdbc:sqlite:" + dbName;
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    /**
     * Testing method. Gets all users
     * @return Array of jsonObjects
     */
    public String getAllUsers() {
        String sql = "SELECT * FROM Users";
        JSONArray arrayJsonResult = new JSONArray();
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                JSONObject jsonObjectResult = new JSONObject();
                for (int i = 0; i < columnCount; i++) {
                    jsonObjectResult.put(rs.getMetaData().getColumnName(i + 1), rs.getString(i + 1)); // sqlite starts counting from 1
                }
                arrayJsonResult.put(jsonObjectResult);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arrayJsonResult.toString();
    }

    public String getDataFromDB(String sqlQuery){
        JSONArray jsonArrayResult = new JSONArray();
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlQuery)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                JSONObject jsonObjectResult = new JSONObject();
                for (int i = 0; i < columnCount; i++) {
                    jsonObjectResult.put(rs.getMetaData().getColumnName(i + 1), rs.getString(i + 1)); // sqlite starts counting from 1
                }
                jsonArrayResult.put(jsonObjectResult);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return jsonArrayResult.toString();
    }

    public void editDataInDB(String sqlQuery){
        JSONArray jsonArrayResult = new JSONArray();
        executeSqlQuery(sqlQuery);

    }

    public ResultSet executeSqlQuery(String sqlQuery){
        ResultSet rs = null;
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement()
        ) {
            rs = stmt.executeQuery(sqlQuery);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return rs;
    }

//    public
}
