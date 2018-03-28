package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public String getAllUsers(){
        return serverDaoImpl.getAllUsers();
    }

    public String getDataFromDB(String sqlQuery){
        return serverDaoImpl.getDataFromDB(sqlQuery);
    }

    public void editDataInDB(String editingType, String jsonStringed){
        JSONObject jsonObject=new JSONObject(jsonStringed);
        String userName = jsonObject.getString("userName");
        String passwordHash = jsonObject.getString("passwordHash");
        
        //serverDaoImpl.editDataInDB(sqlQuery);
    }

    public String getStringFromJsonArray(String jsonString){
        JSONArray jsonObject = new JSONArray(jsonString);
        String responsePass = jsonObject.getJSONObject(0).getString("passwordHash");
        return responsePass;
    }



}
