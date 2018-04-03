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

    public String getUserPass(String jsonStringed){
        String sqlQuery = "SELECT passwordHash " +
                "FROM Users " +
                "WHERE (userName=\""
                + getJsonStringValue(jsonStringed,"userName")
                + "\")";

        String jsonString = getDataFromDB(sqlQuery);
        JSONArray jsonArray = new JSONArray(jsonString);
        if (jsonArray.length() == 0) {
            return "empty";
        } else {
            return jsonArray.getJSONObject(0).getString("passwordHash");
        }
    }

    public void saveUserInDB(String jsonStringed) {
        String sqlQuery = "INSERT INTO Users (userName, passwordHash) VALUES(?,?)";
        serverDaoImpl.saveUserInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "userName"),
                encodeString(
                        getJsonStringValue(jsonStringed, "password")
                ));
    }

    public void saveTaskInDB(String jsonStringed) {
        String taskBody;
        boolean isCompleted;
        try {
            taskBody = getJsonStringValue(jsonStringed,"taskBody");
        } catch (JSONException e) {
            taskBody = null;
        }
        try {
            isCompleted = getJsonBooleanValue(jsonStringed, "isCompleted");
        } catch (JSONException e) {
            isCompleted = false;
        }
        String sqlQuery = "INSERT INTO Tasks (taskName, taskBody, isCompleted) VALUES(?,?,?)";
        serverDaoImpl.saveTaskInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "taskName"),
                taskBody, isCompleted);
    }

    public void savePomodoroInDB(String jsonStringed) {
        int workTime;
        int restTime;
        boolean isWorkSkipped;
        boolean isRestSkipped;

        try {
            workTime = getJsonIntValue(jsonStringed,"workTime");
        } catch (JSONException e) {
            workTime = 1500;
        }
        try {
            restTime = getJsonIntValue(jsonStringed, "restTime");
        } catch (JSONException e) {
            restTime = 300;
        }
        try {
            isWorkSkipped = getJsonBooleanValue(jsonStringed, "isWorkSkipped");
        } catch (JSONException e) {
            isWorkSkipped = false;
        }
        try {
            isRestSkipped = getJsonBooleanValue(jsonStringed, "isRestSkipped");
        } catch (JSONException e) {
            isRestSkipped = false;
        }
        String sqlQuery = "INSERT INTO Pomodoros (taskID, userID, workTime, restTime, isWorkSkipped, isRestSkipped) " +
                "VALUES(?,?,?,?,?,?)";

        serverDaoImpl.savePomodoroInDB(sqlQuery,
                getJsonStringValue(jsonStringed,"taskID"),
                getJsonStringValue(jsonStringed,"userID"),
                workTime, restTime, isWorkSkipped, isRestSkipped);
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

    public String getJsonStringValue(String jsonStringed, String fieldName){
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getString(fieldName);
    }
    public int getJsonIntValue(String jsonStringed, String fieldName){
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getInt(fieldName);
    }
    public boolean getJsonBooleanValue(String jsonStringed, String fieldName){
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getBoolean(fieldName);
    }
}
