package webserver;

import java.util.Iterator;
import java.util.concurrent.Executors;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

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
        String defaultHandlerAdress = "/"; // this handles both of the requests. Could be split
        String getHandlerAdress = "/get";
        String postHandlerAdress = "/post";
        InetSocketAddress addr = new InetSocketAddress(socketNumber);
        HttpServer server = HttpServer.create(addr, 0);

        server.createContext(defaultHandlerAdress, new DefaultHandler());
        server.setExecutor(Executors.newCachedThreadPool());
        server.start();
        InetAddress IP = InetAddress.getLocalHost();
        System.out.println("IP of my system is := " + IP.getHostAddress() + ":" + socketNumber);
        System.out.println("Server is listening on port " + socketNumber);
        System.out.println("Go to \n localhost:" + socketNumber
                + " \n 127.0.0.1:" + socketNumber
                + " \n Local web adress: " + IP.getHostAddress() + ":" + socketNumber
        );
    }
}

class DefaultHandler implements HttpHandler {

    public void handle(HttpExchange exchange) throws IOException {
        String requestMethod = exchange.getRequestMethod();
        if (requestMethod.equalsIgnoreCase("GET")) {
            Headers responseHeaders = exchange.getResponseHeaders();
            Headers requestHeaders = exchange.getRequestHeaders();
            responseHeaders.set("Content-Type", "text/plain");
            exchange.sendResponseHeaders(200, 0);

            OutputStream responseBody = exchange.getResponseBody();
//            Headers requestHeaders = exchange.getRequestHeaders();
//            Set<String> keySet = requestHeaders.keySet();
//            Iterator<String> iter = keySet.iterator();

            String output = "HELLO WORLD"
                    + "\n\n\n This is a GET response \n\n\n";
//            while (iter.hasNext()) {
//                String key = iter.next();
//                List values = requestHeaders.get(key);
//                String s = key + " = " + values.toString() + "\n";
//                responseBody.write(s.getBytes());
//            }

            int contentLength = Integer.parseInt(requestHeaders.getFirst("Content-length"));

            // REQUEST Body
            InputStream is = exchange.getRequestBody();

            Scanner s = new Scanner(is).useDelimiter("\\A");
            String inputStreamString = s.hasNext() ? s.next() : "";

            if ("login".equals(getFieldValue(inputStreamString, "showPage"))) {
                output="This is a login page";
            }
            responseBody.write(output.getBytes());
            responseBody.close();
        }

        if (requestMethod.equalsIgnoreCase(
                "POST")) {
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

            Scanner s = new Scanner(is).useDelimiter("\\A");
            String inputStreamString = s.hasNext() ? s.next() : "";
            String output = "\n\n\nThis is a POST response \n\n\n" + inputStreamString;
            JSONObject jsonOutput;

            if ("testPSWD".equals(getFieldValue(inputStreamString, "pswd"))) { //TODO login change to stored pswrd
                //jsonOutput = new JSONObject("{\"phonetype\":\"N95\",\"cat\":\"WP\"}");
                output="{\"pswrdAnswer\":\"true\"}";
                //responseBody.write(jsonOutput.getBytes());
            }else{
                output="{\"pswrdAnswer\":\"false\"}";
            }
            responseBody.write(output.getBytes());
            responseBody.close();

//            byte[] data = new byte[contentLength];
//            int length = is.read(data);
            // RESPONSE Headers
            // Send RESPONSE Headers
//            extends.sendResponseHeaders(HttpURLConnection.HTTP_OK, contentLength);
            // TODO: WTF isn't it working?
            // RESPONSE Body
//            OutputStream os = exchange.getResponseBody();
//
//            os.write(data);
//            responseBody.write(data);
            

//            responseBody.write(output.getBytes());
//            responseBody.close();
        }
    }
    public String getFieldValue(String JsonString, String searchable) throws JSONException {
        JSONObject jObject = new JSONObject(JsonString);
        String outputValue = jObject.getString(searchable);

        return outputValue;

    }
    public String EvaluatePswd(String JsonString)throws JSONException{
        String pswrdBool="";
        return pswrdBool;
    }
}
