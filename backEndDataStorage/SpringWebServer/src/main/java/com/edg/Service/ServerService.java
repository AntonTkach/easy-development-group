package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public String getAllUsers(){
        return serverDaoImpl.getAllUsers();
    }

    public String getDataFromDB(String sqlQuery, String dbName){
        return serverDaoImpl.getDataFromDB(sqlQuery, dbName);
    }
}
