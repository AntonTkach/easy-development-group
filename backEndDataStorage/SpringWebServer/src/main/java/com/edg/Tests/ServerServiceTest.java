/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edg.Tests;

import com.edg.Dao.ServerDaoImpl;
import com.edg.Service.ServerService;
import javax.annotation.Resource;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;
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
@WebAppConfiguration

public class ServerServiceTest {
     private MockMvc mockMvc;
     @Autowired
    private ServerDaoImpl serverDaoImpl;
     @Value("posts.json")
    private Resource postsJson;
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
        @Test
        public void getAllTasksTest() throws Exception{
               this.mockMvc.perform(get("/"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("task"))
                    .andDo(print());
        }
         @Test
        public void getUserPassTest() throws Exception{
             String jsonString = TestUtil.toString(postsJson.getInputStream());
             
             serverDaoImpl.expect(requestTo("https://jsonplaceholder.typicode.com/posts?userId=1"))
                .andRespond(withSuccess(jsonString, MediaType.APPLICATION_JSON_UTF8));

               this.mockMvc.perform(get("/"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("task"))
                    .andDo(print());
        }
        
}
