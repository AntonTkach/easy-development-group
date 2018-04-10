package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ServerService {

    @Autowired
    private ServerDaoImpl serverDaoImpl; //make able to use serverDaoImpl

    /**
     * General method for retrieving data from database
     *
     * @param sqlQuery The query that will be executed in database
     * @return JsonString with data, relative to query
     */
    public String getDataFromDB(String sqlQuery) {
        return serverDaoImpl.getDataFromDB(sqlQuery);
    }

    /**
     * Retries hashed password from database based on client's JSON
     *
     * @param jsonStringed JSON in string format
     * @return Stored user hashed password
     */
    public String getUserPass(String jsonStringed) {
        String sqlQuery = "SELECT passwordHash " +
                "FROM Users " +
                "WHERE (userName=\""
                + getJsonStringValue(jsonStringed, "userName")
                + "\")";

        String jsonString = getDataFromDB(sqlQuery);
        JSONObject jsonObject = new JSONObject(jsonString);
        if (jsonObject.length() == 0) {
            return "empty";
        } else {
            return jsonObject.getString("passwordHash");
        }
    }

    /**
     * Saves new user to database based on client's JSON
     *
     * @param jsonStringed JSON in string format
     */
    public void saveUserInDB(String jsonStringed) {
        String sqlQuery = "INSERT INTO Users (userName, passwordHash) VALUES(?,?)";
        serverDaoImpl.saveUserInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "userName"),
                encodeString(
                        getJsonStringValue(jsonStringed, "password")
                ));
    }

    /**
     * Saves new task to database based on client's JSON
     *
     * @param jsonStringed JSON in string format
     */
    public void saveTaskInDB(String jsonStringed) {
        String taskBody;
        boolean isCompleted;
        try {
            taskBody = getJsonStringValue(jsonStringed, "taskBody");
        } catch (JSONException e) {
            taskBody = null;
        }
        try {
            isCompleted = getJsonBooleanValue(jsonStringed, "isCompleted");
        } catch (JSONException e) {
            isCompleted = false;
        }
        String sqlQuery = "INSERT INTO Tasks (taskName, taskBody, isCompleted, timestamp) VALUES(?,?,?,?)";
        serverDaoImpl.saveTaskInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "taskName"),
                taskBody, isCompleted,
                generateTimestamp());
    }
    public String getLastRecordID(String tableName, String IDName){
        String getLastIDQuery="SELECT MAX("+IDName+") FROM "+tableName;
        return serverDaoImpl.getDataFromDB(getLastIDQuery);
    }

    public String getAllTasks() {
        return serverDaoImpl.getAllTasks();
    }

    public void updateTaskInDB(String jsonStringed) {
        String sqlQuery = "UPDATE Tasks SET taskName = ?, taskBody = ?, isCompleted = ? WHERE taskID = ?";
        serverDaoImpl.updateTaskInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "taskName"),
                getJsonStringValue(jsonStringed, "taskBody"),
                getJsonBooleanValue(jsonStringed, "isCompleted"));
    }

    public void deleteTaskInDB(String jsonStringed) {
        String sqlQuery = "DELETE FROM Tasks WHERE taskID = ?";
        serverDaoImpl.deleteTaskInDB(sqlQuery, getJsonIntValue(jsonStringed, "taskID"));
    }

    /**
     * Saves new pomodoro to database based on client's JSON
     *
     * @param jsonStringed JSON in string format
     */
    public void savePomodoroInDB(String jsonStringed) {
        int workTime;
        int restTime;
        boolean isWorkSkipped;
        boolean isRestSkipped;

        try {
            workTime = getJsonIntValue(jsonStringed, "workTime");
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
        String sqlQuery = "INSERT INTO Pomodoros " +
                "(taskID, userID, workTime, restTime, isWorkSkipped, isRestSkipped, timestamp) " +
                "VALUES(?,?,?,?,?,?,?)";

        serverDaoImpl.savePomodoroInDB(sqlQuery,
                getJsonStringValue(jsonStringed, "taskID"),
                getJsonStringValue(jsonStringed, "userID"),
                workTime, restTime, isWorkSkipped, isRestSkipped,
                getJsonIntValue(jsonStringed, "timestamp"));
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

    /**
     * Gets a specific String value from single layer JSON
     *
     * @param jsonStringed JSON in string format
     * @param fieldName    The field name which value is needed
     * @return Field value
     */
    public String getJsonStringValue(String jsonStringed, String fieldName) {
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getString(fieldName);
    }

    /**
     * Gets a specific int value from single layer JSON
     *
     * @param jsonStringed JSON in string format
     * @param fieldName    The field name which value is needed
     * @return Field value
     */
    public int getJsonIntValue(String jsonStringed, String fieldName) {
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getInt(fieldName);
    }

    /**
     * Gets a specific boolean value from single layer JSON
     *
     * @param jsonStringed JSON in string format
     * @param fieldName    The field name which value is needed
     * @return Field value
     */
    public boolean getJsonBooleanValue(String jsonStringed, String fieldName) {
        JSONObject jsonObject = new JSONObject(jsonStringed);
        return jsonObject.getBoolean(fieldName);
    }

    /**
     * Get UNIX-time
     * @return Time is milliseconds since 01.01.1970 00:00
     */
    public long generateTimestamp() {
        Date date = new Date();
        long result = date.getTime();
        return result;
    }
}
