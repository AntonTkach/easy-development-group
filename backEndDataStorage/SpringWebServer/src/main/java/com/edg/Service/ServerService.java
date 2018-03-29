package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl;

    public String getAllUsers() {
        return serverDaoImpl.getAllUsers();
    }

    public String getDataFromDB(String sqlQuery) {
        return serverDaoImpl.getDataFromDB(sqlQuery);
    }

    public void saveUserInDB(String jsonStringed) {

        JSONObject jsonObject = new JSONObject(jsonStringed);
        String userName = jsonObject.getString("userName");
        String password = jsonObject.getString("password");
        password = encodeString(password);

        String sqlQuery = "INSERT INTO Users (userName, passwordHash) VALUES(?,?)";

        serverDaoImpl.saveUserInDB(sqlQuery, userName, password);
    }

    public void saveTaskInDB(String jsonStringed) {
        JSONObject jsonObject = new JSONObject(jsonStringed);
        String taskName = jsonObject.getString("taskName");
        String taskBody = "";
        try {
            taskBody = jsonObject.getString("taskBody");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        boolean isCompleted = jsonObject.getBoolean("isCompleted");

        String sqlQuery = "INSERT INTO Tasks (taskName, taskBody, isCompleted) VALUES(?,?,?)";

        serverDaoImpl.saveTaskInDB(sqlQuery, taskName, taskBody, isCompleted);
    }

    /*public String getStringFromJsonArray(String jsonString) {
        JSONArray jsonObject = new JSONArray(jsonString);
        String responsePass = jsonObject.getJSONObject(0).getString("passwordHash");
        return responsePass;
    }*/

    /**
     * Creates hash using BCrypt algorithm
     *
     * @param input String to encode
     * @return Encoded string
     */
    public String encodeString(String input) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);//default strength = 16 (response time 10.5 sec)
        // Possible values 10 (instantly), 12 (1 sec), 14 (2.5 sec)
        return encoder.encode(input);
    }


}
