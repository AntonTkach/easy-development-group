package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import com.edg.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public Collection<User> getAllUsers(){
        return serverDaoImpl.getAllUsers();
    }
    public void getAllRows(){
        serverDaoImpl.getAllRows();
    }
}
