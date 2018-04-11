/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edg.Tests;

import com.edg.Dao.ServerDaoImpl;
import com.edg.Service.ServerService;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
 
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
 
@RunWith(SpringRunner.class)
@WebMvcTest(controllers = ServerService.class)
public class ServerServiceTest {
     private MockMvc mockMvc;
     @Autowired
    private ServerDaoImpl serverDaoImpl;
       @Before
        public void getDataFromDBTest() {
         mockMvc = MockMvcBuilders.standaloneSetup(new ServerService()).build();
        }
        @Test
        public void testServer() throws Exception{
               this.mockMvc.perform(get("/"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("server"))
                    .andDo(print());
        }
}
