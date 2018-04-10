package com.edg.Controller;

import com.edg.Service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class ServerController {

    @Autowired
    private ServerService serverService;

    /**
     * Checks password for a given person
     *
     * @param jsonStringed The user, whose data is to be grabbed.
     *                     Must be the same header name in request
     * @return JSON with the password
     */
    @RequestMapping(value = "/signin", method = RequestMethod.POST)
    public ResponseEntity<Object> checkPassword(@RequestBody String jsonStringed, HttpServletResponse response) {

        String password = serverService.getJsonStringValue(jsonStringed, "password");
        String responsePass = serverService.getUserPass(jsonStringed);

        if (new BCryptPasswordEncoder().matches(password, responsePass)) {
            response.addCookie(
                    new Cookie(
                            "userName",
                            serverService.getJsonStringValue(jsonStringed, "userName")
                    )); // default(-1) = removed when browser is closed
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
     * Register user with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public void saveUserInDB(@RequestBody String jsonStringed) {
        serverService.saveUserInDB(jsonStringed);
    }

    @RequestMapping(value = "/gettasks", method = RequestMethod.GET)
    public String getAllTasksInDB() {
        return serverService.getAllTasks();
    }

    /**
     * Save a Task with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/savetask", method = RequestMethod.POST)
    public void saveTaskInDB(@RequestBody String jsonStringed) {
        serverService.saveTaskInDB(jsonStringed);
    }

    /**
     * Update existing task by given ID
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/updatetask", method = RequestMethod.POST)
    public void updateTaskInDB(@RequestBody String jsonStringed) {
        serverService.updateTaskInDB(jsonStringed);
    }
    @RequestMapping(value = "/deletetask", method = RequestMethod.POST)
    public void deleteTaskInDB(@RequestBody String jsonStringed) {
        serverService.deleteTaskInDB(jsonStringed);
    }

    /**
     * Save a Pomodoro with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/savepomodoro", method = RequestMethod.POST)
    public void savePomodoroInDB(@RequestBody String jsonStringed) {
        serverService.savePomodoroInDB(jsonStringed);
    }



    /*@RequestMapping(value = "/", method = RequestMethod.GET)
    public String greeting() {

        return "greeting";
    }*/

    /**
     * Open a default (index) page
     *
     * @return A view named "index" from template resources/folder
     */
    @GetMapping(value = "/")
    public String index() {
        return "index";
    }

    /**
     * Open a sign up page
     *
     * @return A view named "SignUpPage" from template resources/folder
     */
    @GetMapping(value = "/signUp")
    public String signUp() {
        return "SignUpPage";
    }
}
