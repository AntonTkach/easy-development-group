package com.edg.Dao;

public interface ServerDao {

    String getAllUsers();
    String getDataFromDB(String sqlQuery);
    void saveUserInDB(String sqlQuery, String userName, String passwordHash);
    void saveTaskInDB(String sqlQuery, String taskName, String taskBody, boolean isCompleted);

}
