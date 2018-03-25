package com.edg.Controller;

import com.edg.Service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
        return serverService.getDataFromDB(sqlQuery, "TODOpomodoro.db");
    }*/

    /**
     * Retrieves password for a given person
     *
     * @param userName The user, whose data is to be grabbed.
     *                 Must be the same header name in request
     * @return JSON with the password
     */
    @RequestMapping(value = "/checkpass", method = RequestMethod.GET)
    public String checkPassword(@RequestHeader String userName) {
        String sqlQuery = "SELECT passwordHash " +
                "FROM Users " +
                "WHERE (userName=\"" + userName + "\")";
        return serverService.getDataFromDB(sqlQuery, "TODOpomodoro.db");
    }

    /**
     * Draft for GET handling
     *
     * @param headerGet
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public void getData(@RequestHeader String headerGet) {
        System.out.println(headerGet);
//        return serverService.getDataFromDB(sqlQuery, "TODOpomodoro.db");
    }

    /**
     * Draft for POST handling
     *
     * @param headerPost
     */
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public void handlePost(@RequestHeader String headerPost) {
        System.out.println(headerPost);
//        return serverService.getDataFromDB(sqlQuery, "TODOpomodoro.db");
    }

}
