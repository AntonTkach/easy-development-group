package com.edg.Dao;

import com.edg.Entity.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collection;

@Repository
public class ServerDao {

    String dbName="TODOpomodoro.db"
    String url="jdbc:sqlite:"+dbName;

    Collection<User> getAllUsers(){
        return new ArrayList<User>(){
            {
                add(new User(555, "Carl", "hash1"));
            }
        };
    }

    public boolean getUserHash(String userName, String passwordHash){
        String userHash= this.users.get(passwordHash);
        return true;
    }
}
