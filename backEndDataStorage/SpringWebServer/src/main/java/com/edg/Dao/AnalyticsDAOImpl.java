package com.edg.Dao;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.sql.*;

@Repository
public class AnalyticsDAOImpl implements AnalyticsDAO {
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

    /* *

        TODO: SQL FOR Analytics. REWATCH FOR NEW LOGIC.

        select * from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        inner join Tasks on Tasks.taskID = Pomodoros.taskID

        --1.	Total of eaten pomodoros
        select count(pomodoroID),Users.userName from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        --where Users.userName = "Nomad"
        group by Users.userName


        --2.	Total tasks done
        select count(taskID),userName from Tasks
        inner join Users on Users.userID = Tasks.userID
        where Tasks.isCompleted = 1 and Users.userName = "Nomad"
        group by userName


        --3.	Total tasks added
        select count(taskID),userName from Tasks
        inner join Users on Users.userID = Tasks.userID
        --where Users.userName = "Nomad"
        group by userName


        --4.	Total possible rest had
        select sum(Pomodoros.restTime),Users.userName from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        where Users.userName = "Nomad"
        group by Users.userName


        --5.	Total time worked
        select sum(Pomodoros.workTime),Users.userName from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        where Users.userName = "Nomad"
        group by Users.userName


        --6.	Total time in general on work/rest
        select sum(Pomodoros.workTime)+sum(Pomodoros.restTime),Users.userName from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        where Users.userName = "Nomad"
        group by Users.userName


        --7.	Average # of pomodoros per task
        select count(pomodoroID)*1.0/(
        select count(taskID) from Tasks
        inner join Users on Users.userID = Tasks.userID
        where Tasks.isCompleted = 1 and Users.userName = "Sam"
        group by userName
        ) as taskCount from  Pomodoros
        inner join Users on Users.userID = Pomodoros.userID
        where Users.userName = "Sam"
        group by Users.userName


        --8.	Average # of pomodoros per day/week


        --9.	Average # of tasks per day/week


        --10.	Average # of tasks done per day/week



    * */


}