package com.edg.Service;

import com.edg.Dao.ServerDaoImpl;
import org.json.JSONArray;
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

    public void editDataInDB(String editingType, String jsonStringed) {

        if (editingType.equals("store user")) {
            JSONObject jsonObject = new JSONObject(jsonStringed);
            String userName = jsonObject.getString("userName");
            String password = jsonObject.getString("password");
            password = encodeString(password);

            String sqlQuery = "INSERT INTO Users (userName, passwordHash) VALUES(?,?)";

            serverDaoImpl.saveUserInDB(sqlQuery, userName, password);
        }


    }

    public String getStringFromJsonArray(String jsonString) {
        JSONArray jsonObject = new JSONArray(jsonString);
        String responsePass = jsonObject.getJSONObject(0).getString("passwordHash");
        return responsePass;
    }

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
