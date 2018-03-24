package com.edg.Dao;

import com.edg.Entity.User;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Repository
public class ServerDaoImpl implements ServerDao {

    /*String dbName="TODOpomodoro.db";
    String url="jdbc:sqlite:"+dbName;*/


    private Connection connect() {
        // SQLite connection string
        String dbName = "TODOpomodoro.db";
        String url = "jdbc:sqlite:" + dbName;
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
    /*Collection<User> getAllUsers(){
        return new ArrayList<User>(){
            {
                add(new User(555, "Carl", "hash1"));
            }
        };
    }
*/

    private static Map<Integer, User> users;

    static {
        users = new HashMap<Integer, User>() {
            {
                put(1, new User(1, "Carl", "hash1"));
                put(2, new User(2, "Paul", "hash2"));
                put(3, new User(3, "Alex", "hash3"));
            }
        };
    }

    public Collection<User> getAllUsers() {
        return this.users.values();
    }

    public void getAllRows() {
        String sql = "SELECT * FROM Users";

        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("userID") + "\t" +
                        rs.getString("userName") + "\t" +
                        rs.getString("passwordHash"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    /*public boolean getUserHash(String userName, String passwordHash){
        String userHash= this.users.get(passwordHash);
        return true;
    }*/
    }
}
