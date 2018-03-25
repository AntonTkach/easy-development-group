package com.edg.Controller;

import com.edg.Entity.User;
import com.edg.Service.ServerService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
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

    /*@RequestMapping(value = "/rows", method = RequestMethod.GET)
    public void getAllRows(){
        serverService.getAllRows();
    }*/

    @RequestMapping(value = "/array", method = RequestMethod.GET)
    public ArrayList<String[]> getAllRows(){
        return serverService.getAllRows();
    }

    @RequestMapping(value = "/json", method = RequestMethod.GET)
    public String getAllRowsJson(){
        String result;
        result=serverService.getAllRowsJson().toString();
        //System.out.println(result);
        JSONArray jsonResult=new JSONArray(result);
        return jsonResult.toString();
    }
}
