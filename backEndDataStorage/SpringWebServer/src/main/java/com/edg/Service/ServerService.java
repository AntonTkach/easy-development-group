package com.edg.Service;

import com.edg.Dao.ServerDao;
import com.edg.Dao.ServerDaoImpl;
import com.edg.Entity.User;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public Collection<User> getAllUsers(){
        return serverDaoImpl.getAllUsers();
    }
    /*public void getAllRows(){
        serverDaoImpl.getAllRows();
    }*/
    public ArrayList<String[]> getAllRows(){
        return serverDaoImpl.getAllRows();
    }

    public JSONArray getAllRowsJson(){
        return serverDaoImpl.getAllRowsJson();
    }
}
