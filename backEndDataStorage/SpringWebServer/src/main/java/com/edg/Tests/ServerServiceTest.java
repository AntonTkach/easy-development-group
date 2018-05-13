/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edg.Tests;

import com.edg.Dao.ServerDaoImpl;
import com.edg.Service.ServerService;
import javax.annotation.Resource;
import static org.assertj.core.api.Assertions.assertThat;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.autoconfigure.json.JsonTest;
import org.springframework.boot.test.json.JacksonTester;
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
@JsonTest

public class ServerServiceTest {
     private MockMvc mockMvc;
     @Autowired
    private ServerDaoImpl serverDaoImpl;
     @Autowired
    private JacksonTester<ServerService> json;
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
        /**
         @Test
        public void getUserPassTest() throws Exception{
             String jsonString = TestUtil.toString(postsJson.getInputStream());
             
             serverDaoImpl.expect(requestTo("https://jsonplaceholder.typicode.com/posts?userId=1"))
                .andRespond(withSuccess(jsonString, MediaType.APPLICATION_JSON_UTF8));

            List<Post> posts = serverService.readPosts(1);
            assertEquals(9, posts.size());
            serverDaoImpl.verify();
        }
        */
       @Test
	public void updateTaskInDBTest() throws Exception {
		ServerDaoImpl details = new ServerDaoImpl("taskName", "taskBody");
		assertThat(this.json.write(details)).isEqualTo("serverservice.json");
		assertThat(this.json.write(details)).isEqualToJson("serverservice.json");
		assertThat(this.json.write(details)).hasJsonPathStringValue("@.make");
		assertThat(this.json.write(details)).extractingJsonPathStringValue("@.make")
				.isEqualTo("isCompleted");
	}

	@Test
	public void deleteTaskInDBTest() throws Exception {
		String content = "\"DELETE FROM Tasks WHERE taskID = ?\"";
		assertThat(this.json.parse(content))
				.isEqualTo(new ServerService("taskName", "taskBody"));
		assertThat(this.json.parseObject(content).deleteTaskInDB()).isEqualTo("taskID");
	}
        
        @Test
	public void encodeStringTest() throws Exception {
            when(encoder.encode()).thenReturn(input);
             this.mockMvc.perform(get("/encode")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(contains("encode")));
        }
}
