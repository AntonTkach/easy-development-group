package com.edg.Dao;

import com.edg.Entity.User;

import java.util.Collection;

public interface ServerDao {
    Collection<User> getAllUsers();
    void getAllRows();

}
