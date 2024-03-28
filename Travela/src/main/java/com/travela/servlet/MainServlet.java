package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MainServlet
 */

@WebServlet({"/rooms", "/tour", "/roomdetails","/login","/register", "/profile"})
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String URI = request.getRequestURI();
		if (URI.contains("rooms")) {
			request.setAttribute("RoomsPage", true);
		} else if(URI.contains("tour")) {
			request.setAttribute("TourPage", true);	
		} else if(URI.contains("roomdetails")) {
			request.setAttribute("RoomDetailsPage", true);	
		} else if(URI.contains("login")){
			request.setAttribute("LoginPage", true);
		} else if(URI.contains("register")){
			request.setAttribute("RegisterPage", true);
		} else if (URI.contains("profile")){
			request.setAttribute("ProfilePage", true);
		} else {
			request.setAttribute("HomePage", true);
		}
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
