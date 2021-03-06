package com.edg.Controller;

import com.edg.Analytics.PomodorosAnalysis;
import com.edg.Analytics.TasksAnalysis;
import com.edg.Dao.ServerDaoImpl;
import com.edg.Service.ServerService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class ServerController {

    @Autowired
    private ServerService serverService;

    @Autowired
    private ServerDaoImpl serverDaoImpl;

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
     * Register user with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void saveUserInDB(@RequestBody String jsonStringed) {
        serverService.saveUserInDB(jsonStringed);
    }

    /**
     * Return all tasks created by a certain user
     *
     * @param userName Username that defines, what tasks must be returned
     * @return Entity object with all tasks associated with given user
     */
    @RequestMapping(value = "/gettasks", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getAllTasksInDB(@CookieValue String userName) {
        return new ResponseEntity<Object>(serverService.getAllTasks(userName), HttpStatus.OK);
    }

    @RequestMapping(value = "/gettasksanalysis", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getTasksAnalysisJSON(@CookieValue String userName) {
        return new ResponseEntity<Object>(TasksAnalysis.getTasksAnalysisJSON(serverService.getUserIDByUsername(userName), serverDaoImpl), HttpStatus.OK);
    }

    @RequestMapping(value = "/getpomodorosanalysis", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> getPomodorosAnalysisJSON(@CookieValue String userName) {
        return new ResponseEntity<Object>(PomodorosAnalysis.getPomodorosAnalysisJSON(serverService.getUserIDByUsername(userName), serverDaoImpl), HttpStatus.OK);
    }

    /**
     * Save a Task with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/savetask", method = RequestMethod.POST)
    public ResponseEntity<Object> saveTaskInDB(@RequestBody String jsonStringed, @CookieValue String userName) {
        serverService.saveTaskInDB(jsonStringed, userName);
        TasksAnalysis.updateTotalTasksNumber(serverService.getUserIDByUsername(userName), serverDaoImpl);
        return new ResponseEntity<Object>(
                serverService.getLastRecordID("Tasks", "taskID"), HttpStatus.OK);
    }

    /**
     * Update existing task by given ID
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/updatetask", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void updateTaskInDB(@RequestBody String jsonStringed, @CookieValue String userName) {
        serverService.updateTaskInDB(jsonStringed);
        TasksAnalysis.updateTasksDoneNumber(serverService.getUserIDByUsername(userName), serverDaoImpl);
    }

    /**
     * Delete existing task by given ID
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/deletetask", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void deleteTaskInDB(@RequestBody String jsonStringed, @CookieValue String userName) {
        serverService.deleteTaskInDB(jsonStringed);
        TasksAnalysis.updateTotalTasksNumber(serverService.getUserIDByUsername(userName), serverDaoImpl);
    }

    /**
     * Save a Pomodoro with info received in JSON from client
     *
     * @param jsonStringed - JSON in request body. Is parsed to string automatically
     */
    @RequestMapping(value = "/savepomodoro", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void savePomodoroInDB(@RequestBody String jsonStringed, @CookieValue String userName) {
        serverService.savePomodoroInDB(jsonStringed, userName);
        PomodorosAnalysis.incrementTotalPomodorosNumber(serverService.getUserIDByUsername(userName), serverDaoImpl);
    }

    /**
     * Root handler for serving sign in page
     * @return Returns signin.html as view
     */
    @GetMapping(value = "/")
    public String signIn() {
        return "signin";
    }
    /**
     * Register handler for serving sign up page
     * @return Returns register.html as view
     */
    @GetMapping(value = "/register")
    public String signUp() {
        return "register";
    }
    /**
     * Todo handler for serving dashboard page
     * @return Returns todo.html as view
     */
    @GetMapping(value = "/todo")
    public String todo(@CookieValue(required = false) String userName) {
        if (userName != null){
            return "todo";
        }

        return "redirect:/";
    }
    @GetMapping(value = "/statistics")
    public String statistics(@CookieValue(required = false) String userName) {
        if (userName != null){
            return "statistics";
        }

        return "redirect:/";
    }
}
