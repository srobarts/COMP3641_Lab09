package a00222500.lab09.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Lab09Controller
 */
@WebServlet("/Lab09Controller")
public class Lab09Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Lab09Controller() {
        super();
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestedAction = request.getParameter("action");
		
		if(requestedAction.equals("query")) {
			//query database
			String url = "/jsp/select.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher.forward(request, response);		
		} else if(requestedAction.equals("add")) {
			//update the database
			String url = "/jsp/insert.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} else if(requestedAction.equals("update")) {
			//update the database
			String url = "/jsp/update.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} else if(requestedAction.equals("delete")) {
			//update the database
			String url = "/jsp/delete.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher = getServletContext().getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
