package com.edg.Controller;

import com.edg.Service.ServerService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@RestController
@RequestMapping("/")
public class ServerController {

    @Autowired
    private ServerService serverService;

    /**
     * Gives back all users
     *
     * @return String representation of JsonArray
     */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getAllUsers() {
        return serverService.getAllUsers().toString();
    }

    /*@RequestMapping(value = "/{userNameReceived}", method = RequestMethod.GET)
    public String checkPassword(@PathVariable("userNameReceived") String userName) {
        String sqlQuery = "SELECT passwordHash " +
                "FROM Users " +
                "WHERE (userName=\"" + userName + "\")";
        return serverService.getDataFromDB(sqlQuery);
    }*/

    /**
     * Checks password for a given person
     *
     * @param userName The user, whose data is to be grabbed.
     *                 Must be the same header name in request
     * @return JSON with the password
     */
    @RequestMapping(value = "/checkpass", method = RequestMethod.POST)
    public ResponseEntity<Object> checkPassword(@RequestHeader String userName, @RequestHeader String password) {
        String sqlQuery = "SELECT passwordHash " +
                "FROM Users " +
                "WHERE (userName=\"" + userName + "\")";

        String jsonString = serverService.getDataFromDB(sqlQuery);

        JSONArray jsonArray = new JSONArray(jsonString);
        String responsePass = jsonArray.getJSONObject(0).getString("passwordHash");



//        System.out.println((encoder.matches(password, responsePassEnc))); //gives out TRUE
        //BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        if (new BCryptPasswordEncoder().matches(password, serverService.encodeString(responsePass))) {
            return ResponseEntity.ok("Authenticated");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
        
        //TODO: uncomment, when storing hashes is implemented
        /*if (new BCryptPasswordEncoder().matches(password, responsePass)) {
            return ResponseEntity.ok("Authenticated");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }*/

        /*if (serverService.getStringFromJsonArray(jsonString).equals(password)) {
            return ResponseEntity.ok("Authenticated");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }*/
    }

    /**
     * Draft for GET handling
     *
     * @param headerGet
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public void getData(@RequestHeader String headerGet) {
        System.out.println(headerGet);
//        return serverService.getDataFromDB(sqlQuery);
    }

    /**
     * Draft for POST handling
     *
     * @param headerPost
     */
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public void handlePost(@RequestHeader String headerPost) {
        System.out.println(headerPost);
//        return serverService.getDataFromDB(sqlQuery);
    }

    /**
     * Draft for POST data handling
     *
     * @param editingType - type of SQL edit query
     */
    @RequestMapping(value = "/storeData", method = RequestMethod.POST)
    public void editData(@RequestHeader String editingType, @RequestHeader String jsonStringed) {
        System.out.println(editingType);
        serverService.editDataInDB(editingType, jsonStringed);
    }


    /*@RequestMapping(value = "/", method = RequestMethod.GET)
    public String greeting() {

        return "index";
    }*/
}
