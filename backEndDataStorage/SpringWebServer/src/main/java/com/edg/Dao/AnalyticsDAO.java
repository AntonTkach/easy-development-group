package com.edg.Dao;

public interface AnalyticsDAO{
    //void saveUserInDB(String sqlQuery, String userName, String passwordHash);
    void analyseSaveTaskInDB(String sqlQuery, String taskName, String taskBody, String userID, boolean isCompleted, long timestamp);
    void analyseUpdateTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted, int taskID);
    void analyseDeleteTaskInDB(String sqlQuery, int taskID);
    void analyseSavePomodoroInDB(String sqlQuery);

}