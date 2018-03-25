package com.edg.Dao;

import com.edg.Entity.User;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.awt.List;
import java.io.DataOutputStream;
import java.sql.*;
import java.util.*;

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
                put(1, new User(1, "Carl", "FAKEhash1"));
                put(2, new User(2, "Paul", "FAKEhash2"));
                put(3, new User(3, "Alex", "FAKEhash3"));
            }
        };
    }

    public Collection<User> getAllUsers() {
        return this.users.values();
    }

    public ArrayList<String[]> getAllRows() {
        String sql = "SELECT * FROM Users";
        ArrayList<String[]> arrayResult = new ArrayList<String[]>();
        String stringJsonResult = "";
        JSONObject objJsonResult = new JSONObject();

        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                String[] row = new String[columnCount];
                for (int i = 0; i < columnCount; i++) {

                    row[i] = rs.getMetaData().getColumnName(i + 1);
                    row[i] += ":" + rs.getString(i + 1);

                }
                arrayResult.add(row);
            }

            //System.out.println(Arrays.toString(arrayResult.toArray()));

            /*// loop through the result set
            while (rs.next()) {
                System.out.println(rs.getInt("userID") + "\t" +
                        rs.getString("userName") + "\t" +
                        rs.getString("passwordHash"));
            }*/


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return arrayResult;

    /*public boolean getUserHash(String userName, String passwordHash){
        String userHash= this.users.get(passwordHash);
        return true; objJsonResult.put(rs.getMetaData().getColumnName(i + 1), rs.getString(i + 1));
    }*/
    }

    public JSONArray getAllRowsJson() {
        String sql = "SELECT * FROM Users";

        //JSONObject objJsonResult = new JSONObject();
        JSONArray arrayJsonResult = new JSONArray();

        try (Connection conn = this.connect();
             Statement stmt = conn.createStatement();


             ResultSet rs = stmt.executeQuery(sql)) {
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                JSONObject objJsonResult = new JSONObject();

                for (int i = 0; i < columnCount; i++) {

                    objJsonResult.put(rs.getMetaData().getColumnName(i+1), rs.getString(i+1));


                }

                arrayJsonResult.put(objJsonResult);
                System.out.println(objJsonResult.toString());
                System.out.println(arrayJsonResult.toString());
            }


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
//        System.out.println(objJsonResult.toString());
        return arrayJsonResult;


    }


}
