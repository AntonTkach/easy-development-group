package com.edg.Controller;

import com.edg.Service.ServerService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
//@RequestMapping("/")
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

    /**
     * Checks password for a given person
     *
     * @param jsonStringed The user, whose data is to be grabbed.
     *                 Must be the same header name in request
     * @return JSON with the password
     */
    @RequestMapping(value = "/checkpass", method = RequestMethod.POST)
    public ResponseEntity<Object> checkPassword(@RequestBody String jsonStringed, HttpServletResponse response) {

        JSONObject jsonObject = new JSONObject(jsonStringed);
        String password = jsonObject.getString("password");
        String responsePass = serverService.getUserPass(jsonStringed);

        if (new BCryptPasswordEncoder().matches(password, responsePass)) {
            response.addCookie(new Cookie("userName", jsonObject.getString("userName"))); // default(-1) = removed when browser is closed
            return ResponseEntity.ok("Authenticated");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }

    }

    /**
     * Draft for GET handling
     *
     * @param headerGet
     */
    /*@RequestMapping(value = "/", method = RequestMethod.GET)
    public void getData(@RequestHeader String headerGet) {
        System.out.println(headerGet);
//        return serverService.getDataFromDB(sqlQuery);
    }
*/
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
     * @param jsonStringed - Json in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    public void saveUserInDB(@RequestBody String jsonStringed) {
        serverService.saveUserInDB(jsonStringed);
    }
    @RequestMapping(value = "/saveTask", method = RequestMethod.POST)
    public void saveTaskInDB(@RequestBody String jsonStringed) {
        serverService.saveTaskInDB(jsonStringed);
    }
    @RequestMapping(value = "/savePomodoro", method = RequestMethod.POST)
    public void savePomodoroInDB(@RequestBody String jsonStringed) {
        serverService.savePomodoroInDB(jsonStringed);
    }


    /*@RequestMapping(value = "/", method = RequestMethod.GET)
    public String greeting() {

        return "greeting";
    }*/

    @GetMapping(value = "/")
    public String signIn() {
        return "signin";
    }
    @GetMapping(value = "/register")
    public String signUp() {
        return "register";
    }
}
