package com.edg.Dao;

public interface AnalyticsDAO{
    //void saveUserInDB(String sqlQuery);
    void analyseSaveTaskInDB(String sqlQuery);
    void analyseUpdateTaskInDB(String sqlQuery);
    void analyseDeleteTaskInDB(String sqlQuery);
    void analyseSavePomodoroInDB(String sqlQuery);
}