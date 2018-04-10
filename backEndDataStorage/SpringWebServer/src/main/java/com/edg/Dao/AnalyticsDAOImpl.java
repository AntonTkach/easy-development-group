package com.edg.Dao;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;

@Repository
public class AnalyticsDAOImpl implements AnalyticsDAO {
    public void analyseSaveTaskInDB(String sqlQuery){
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    void   analyseUpdateTaskInDB(String sqlQuery){
        public void analyseSaveTaskInDB(String sqlQuery){
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    void   analyseDeleteTaskInDB(String sqlQuery){
        public void analyseSaveTaskInDB(String sqlQuery){
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    void analyseSavePomodoroInDB(String sqlQuery){
        public void analyseSaveTaskInDB(String sqlQuery){
        try (Connection conn = this.connect();
             PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery)) {
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}