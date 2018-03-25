package com.edg.Dao;

public interface ServerDao {

    String getAllUsers();
    String getDataFromDB(String sqlQuery, String dbName);

}
