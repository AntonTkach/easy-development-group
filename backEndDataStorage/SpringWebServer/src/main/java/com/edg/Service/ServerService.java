package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public JSONArray getAllUsers(){
        return serverDaoImpl.getAllUsers();
    }
}
