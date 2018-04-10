package com.edg.Dao;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;

@Repository
public class ServerDaoImpl implements ServerDao {
    /**
     * Creates connection to specific database
     *
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


    public String getDataFromDB(String sqlQuery) {
        JSONArray jsonArrayResult = new JSONArray();
        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sqlQuery)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                JSONObject jsonObjectResult = new JSONObject();
                for (int i = 0; i < columnCount; i++) {
                    jsonObjectResult.put(
                            rs.getMetaData().getColumnName(i + 1),
                            rs.getString(i + 1)); // sqlite starts counting from 1
                }
                jsonArrayResult.put(jsonObjectResult);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (jsonArrayResult.length() == 1) {
            return jsonArrayResult.getJSONObject(0).toString();
        } else {
            return jsonArrayResult.toString();
        }

    }

    public void saveUserInDB(String sqlQuery, String userName, String passwordHash) {
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, passwordHash);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public String getAllTasks() {
        String sql = "SELECT * FROM Tasks";
        return getDataFromDB(sql);
    }

    public void saveTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted, long timestamp) {
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.setString(1, taskName);
            preparedStatement.setString(2, taskBody);
            preparedStatement.setBoolean(3, isCompleted);
            preparedStatement.setLong(4, timestamp);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted) {
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sqlQuery)) {

            // set the corresponding param
            pstmt.setString(1, taskName);
            pstmt.setString(2, taskBody);
            pstmt.setBoolean(3, isCompleted);
            // update
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteTaskInDB(String sqlQuery, int taskID) {
        try (Connection conn = this.connect();
             PreparedStatement pstmt = conn.prepareStatement(sqlQuery)) {

            // set the corresponding param
            pstmt.setInt(1, taskID);
            // execute the delete statement
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void savePomodoroInDB(String sqlQuery, String taskID, String userID, int workTime, int restTime,
                                 boolean isWorkSkipped, boolean isRestSkipped, int timestamp) {
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.setString(1, taskID);
            preparedStatement.setString(2, userID);
            preparedStatement.setInt(3, workTime);
            preparedStatement.setInt(4, restTime);
            preparedStatement.setBoolean(5, isWorkSkipped);
            preparedStatement.setBoolean(6, isRestSkipped);
            preparedStatement.setInt(7, timestamp);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ResultSet executeSqlQuery(String sqlQuery) {
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
}
