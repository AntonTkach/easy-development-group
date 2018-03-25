package com.edg.Controller;

import com.edg.Service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class ServerController {

    @Autowired
    private ServerService serverService;

    /**
     * Gives back all users
     * @return String representation of JsonArray
     */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getAllUsers(){
        return serverService.getAllUsers().toString();
    }
}
