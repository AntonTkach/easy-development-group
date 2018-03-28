package com.edg.Dao;

public interface ServerDao {

    String getAllUsers();
    String getDataFromDB(String sqlQuery);
    void editDataInDB(String sqlQuery);

}
