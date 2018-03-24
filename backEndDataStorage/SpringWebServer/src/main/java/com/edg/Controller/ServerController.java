package com.edg.Controller;

import com.edg.Entity.User;
import com.edg.Service.ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RestController
@RequestMapping("/users")
public class ServerController {

    @Autowired
    private ServerService serverService;

    @RequestMapping(method = RequestMethod.GET)
    public Collection<User> getAllUsers(){
        return serverService.getAllUsers();
    }

    @RequestMapping(value = "/rows", method = RequestMethod.GET)
    public void getAllRows(){
        serverService.getAllRows();
    }
}
