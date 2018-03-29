package com.edg.Dao;

public interface ServerDao {

    String getAllUsers();
    String getDataFromDB(String sqlQuery);
    void saveUserInDB(String sqlQuery, String userName, String passwordHash);
    void saveTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted);
    void savePomodoroInDB(String sqlQuery, String taskID, String userID, int workTime, int restTime, boolean isWorkSkipped, boolean isRestSkipped);
}
