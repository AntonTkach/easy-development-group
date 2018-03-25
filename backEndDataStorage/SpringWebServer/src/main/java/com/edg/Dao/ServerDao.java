package com.edg.Dao;

import com.edg.Entity.User;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collection;

public interface ServerDao {
    Collection<User> getAllUsers();
    ArrayList<String[]> getAllRows();
    JSONArray getAllRowsJson();

}
