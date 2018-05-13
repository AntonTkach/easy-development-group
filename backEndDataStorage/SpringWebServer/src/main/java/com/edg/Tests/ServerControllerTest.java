package com.edg.Tests;


import com.edg.Controller.ServerController;
import com.edg.Service.ServerService;
import org.assertj.core.api.Assertions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.json.JsonTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import org.springframework.web.context.WebApplicationContext;


@RunWith(SpringRunner.class)
@WebMvcTest(controllers = ServerController.class)
@WebAppConfiguration
@JsonTest

public class ServerControllerTest {
    private MockMvc mockMvc;

    @Autowired
    private WebApplicationContext webApplicationContext;
    @MockBean
    private ServerController serverControllerMock;
    
    @Before
    public void saveTaskInDB() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
    @Before
    public void saveUserInDB() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }
   /* @Test
    public void saveTaskInDBTest() throws Exception {
        assertThat(this.serverRepository).isNotNull();
        mockMvc.perform(ServerServiceRequestBuilders.post("/register"))
                .andExpect(status().isOk())
                .andExpect(view().name("register"))
                .andExpect(ServerServiceResultMatchers.view().name("register"))
                .andExpect(content().string(Matchers.containsString("Spring Framework Guru")))
                .andDo(print());
    }
    
    */
    
     @Test
    public void getAllTasksInDB() throws Exception {
        Assertions.assertThat(this.serverControllerMock).isNotNull();
        mockMvc.perform(MockMvcRequestBuilders.get("/gettasks"))
                .andExpect(status().isOk())
                .andExpect(content().contentType("text/html;charset=UTF-8"))
                .andExpect(view().name("products"))
                .andExpect(MockMvcResultMatchers.view().name("products"))
                .andDo(print());
    }
    @Test
        public void testIndex() throws Exception{
               this.mockMvc.perform(get("/"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("index"))
                    .andDo(print());
        }
        
    @Test
    public void testSignUp() throws Exception{
               this.mockMvc.perform(get("/"))
                    .andExpect(status().isOk())
                    .andExpect(view().name("signUp"))
                    .andDo(print());
    }
}