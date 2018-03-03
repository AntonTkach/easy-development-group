/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webserver;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executors;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

/**
 *
 * @author Anton
 */
public class WebServer {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        int socketNumber = 8080;
        InetSocketAddress addr = new InetSocketAddress(socketNumber);
        HttpServer server = HttpServer.create(addr, 0);

        server.createContext("/", new DefaultHandler());
        server.setExecutor(Executors.newCachedThreadPool());
        server.start();
        System.out.println("Server is listening on port " + socketNumber);
        System.out.println("Go to localhost:" + socketNumber
                + " or 127.0.0.1:" + socketNumber);
    }
}

class DefaultHandler implements HttpHandler {

    public void handle(HttpExchange exchange) throws IOException {
        String requestMethod = exchange.getRequestMethod();
        if (requestMethod.equalsIgnoreCase("GET")) {
            Headers responseHeaders = exchange.getResponseHeaders();
            responseHeaders.set("Content-Type", "text/plain");
            exchange.sendResponseHeaders(200, 0);

            OutputStream responseBody = exchange.getResponseBody();
//            Headers requestHeaders = exchange.getRequestHeaders();
//            Set<String> keySet = requestHeaders.keySet();
//            Iterator<String> iter = keySet.iterator();
            
            String output="HELLO WORLD";
//            while (iter.hasNext()) {
//                String key = iter.next();
//                List values = requestHeaders.get(key);
//                String s = key + " = " + values.toString() + "\n";
//                responseBody.write(s.getBytes());
//            }
            responseBody.write(output.getBytes());
            responseBody.close();
        }
        
        
        if (requestMethod.equalsIgnoreCase("POST")) {
            Headers responseHeaders = exchange.getResponseHeaders();
            responseHeaders.set("Content-Type", "text/plain");
            exchange.sendResponseHeaders(200, 0);

            OutputStream responseBody = exchange.getResponseBody();
//            Headers requestHeaders = exchange.getRequestHeaders();
//            Set<String> keySet = requestHeaders.keySet();
//            Iterator<String> iter = keySet.iterator();
            
            String output="This is a POST response";
//            while (iter.hasNext()) {
//                String key = iter.next();
//                List values = requestHeaders.get(key);
//                String s = key + " = " + values.toString() + "\n";
//                responseBody.write(s.getBytes());
//            }
            responseBody.write(output.getBytes());
            responseBody.close();
        }
    }
}
