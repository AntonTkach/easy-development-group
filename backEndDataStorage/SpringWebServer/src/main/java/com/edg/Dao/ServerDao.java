package com.edg.Dao;

import java.math.BigDecimal;

public interface ServerDao {
    String getDataFromDB(String sqlQuery);
    void saveUserInDB(String sqlQuery, String userName, String passwordHash);

    String getAllTasks(String sqlQuery);
    void saveTaskInDB(String sqlQuery, String taskName, String taskBody, int userID, boolean isCompleted, long timestamp);
    void updateTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted, int taskID);
    void deleteTaskInDB(String sqlQuery, int taskID);

    void savePomodoroInDB(String sqlQuery, int taskID, int userID, int workTime,
                          int restTime, boolean isWorkSkipped, boolean isRestSkipped, BigDecimal timestamp);

}
