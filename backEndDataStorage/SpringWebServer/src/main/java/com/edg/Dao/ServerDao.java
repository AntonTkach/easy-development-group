package com.edg.Dao;

public interface ServerDao {
    String getDataFromDB(String sqlQuery);
    void saveUserInDB(String sqlQuery, String userName, String passwordHash);

    String getAllTasks();
    void saveTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted, int timestamp);
    void updateTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted);
    void deleteTaskInDB(String sqlQuery, int taskID);

    void savePomodoroInDB(String sqlQuery, String taskID, String userID, int workTime, int restTime, boolean isWorkSkipped, boolean isRestSkipped, int timestamp);

}
