import com.google.gson.Gson;

import com.gargoylesoftware.htmlunit.WebClient;

import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

@WebServlet("/loginServ")
public class loginServlet extends HttpServlet {
	
	//TODO: replace all this with login funcionality:
	
	private static final long serialVersionUID = 1L;
	
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			
			// Replace your API key here after removing the brackets---No use though
			//String apiKey = "";
			
			String searchText = request.getParameter("searchText").trim().replaceAll("\\s", "+");
			
			String radioSelect = request.getParameter("radioSelect");
			//System.out.println(searchedRadio+"here");
			String myUrl = "";
			if (radioSelect!=null){
				myUrl = "https://www.googleapis.com/books/v1/volumes?q="+ radioSelect + ":" + searchText;
			}else{
				myUrl = "https://www.googleapis.com/books/v1/volumes?q="+ searchText;
			}
			String jsonString = createJsonStringFromURL(myUrl);
			
			GsonBuilder builder = new GsonBuilder();
			builder.setPrettyPrinting();
			Gson gson = builder.create();
			
			String json = gson.toJson("");
			
			request.setAttribute("data", json);
			session.setAttribute("data", json);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/SearchResults.jsp");
	        dispatch.forward(request, response);
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	private String createJsonStringFromURL(String desiredUrl) throws Exception {
		URL url = null;
		BufferedReader reader = null;
		StringBuilder stringBuilder;
		
		try {
			url = new URL(desiredUrl);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			connection.setReadTimeout(15*1000);
		    connection.connect();
		    
		    reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		    stringBuilder = new StringBuilder();
		    
		    String line = null;
		    while ((line = reader.readLine()) != null)
		    {
		    	stringBuilder.append(line + "\n");
		    }
			
		    return stringBuilder.toString();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		finally {
			//close your reader!
			reader.close();
		}
	}
}

