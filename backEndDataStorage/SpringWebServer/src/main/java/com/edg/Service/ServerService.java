package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONArray;
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

    public void editDataInDB(String sqlQuery, String dbName){
        serverDaoImpl.editDataInDB(sqlQuery, dbName);
    }

    public String getStringFromJsonArray(String jsonString){
        JSONArray jsonObject = new JSONArray(jsonString);
        String responsePass = jsonObject.getJSONObject(0).getString("passwordHash");
        return responsePass;
    }
}
