package com.edg.Dao;

public interface ServerDao {
    String getDataFromDB(String sqlQuery);
    void saveUserInDB(String sqlQuery, String userName, String passwordHash);

    String getAllTasks(String sqlQuery);
    void saveTaskInDB(String sqlQuery, String taskName, String taskBody, String userID, boolean isCompleted, long timestamp);
    void updateTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted, int taskID);
    void deleteTaskInDB(String sqlQuery, int taskID);

    void savePomodoroInDB(String sqlQuery, String taskID, String userID, int workTime, int restTime, boolean isWorkSkipped, boolean isRestSkipped, int timestamp);

}
