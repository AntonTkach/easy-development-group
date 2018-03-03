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
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

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
                + " or 127.0.0.1:" + socketNumber
                + " \n OR to 192.168.1.108:" + socketNumber);
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

            String output = "HELLO WORLD";
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
            Headers requestHeaders = exchange.getRequestHeaders();
            Set<String> keySet = requestHeaders.keySet();
            Iterator<String> iter = keySet.iterator();

            Set<Map.Entry<String, List<String>>> entries = requestHeaders.entrySet();

            int contentLength = Integer.parseInt(requestHeaders.getFirst("Content-length"));

            // REQUEST Body
            InputStream is = exchange.getRequestBody();

            byte[] data = new byte[contentLength];
            int length = is.read(data);

            // RESPONSE Headers
            // Send RESPONSE Headers
//            extends.sendResponseHeaders(HttpURLConnection.HTTP_OK, contentLength);
            // RESPONSE Body
//            OutputStream os = exchange.getResponseBody();
//
//            os.write(data);
            responseBody.write(data);
//            String output = "This is a POST response \n"
//                    + os.toString() + "\n"
//                    + length + "\n"
//                    + data.toString() + "\n"
//                    + entries.toString() + "\n"
//                    + contentLength + "\n";
            String output = "\n\n\nThis is a POST response \n\n\n"+ data + "\n";
//            output+=HttpServletRequest.getHeaderNames();

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

//    public boolean isInQuery(HttpServletRequest request, String key) {
//        String query = request.getQueryString();
//        System.out.println(query);
//        String[] nameValuePairs = query.split("&");
//        System.out.println(nameValuePairs.toString());
//        for (String nameValuePair : nameValuePairs) {
//            if (nameValuePair.startsWith(key + "=")) {
//                return true;
//            }
//        }
//        return false;
//    }
//
}
