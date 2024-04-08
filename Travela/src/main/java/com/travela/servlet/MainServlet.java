package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.travela.dao.impl.BookingDAOImpl;
import com.travela.dao.impl.RoomDAOImpl;
import com.travela.entity.User;

/**
 * Servlet implementation class MainServlet
 */

@WebServlet(urlPatterns = { "/rooms", "/tour", "/roomdetails", "/profile", "/booking-history" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RoomDAOImpl roomDAOImpl = new RoomDAOImpl();

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
			request.setAttribute("views", "/views/src/page/RoomsPage.jsp");
		} else if (URI.contains("tour")) {
			request.setAttribute("views", "/views/src/page/TourPage.jsp");
		} else if (URI.contains("roomdetails")) {
			request.setAttribute("room", roomDAOImpl.findById(request.getParameter("rid")));
			
			request.setAttribute("views", "/views/src/page/RoomDetailsPage.jsp");
		} else if (URI.contains("profile")) {
			request.setAttribute("views", "/views/src/page/ProfilePage.jsp");
		} else if (URI.contains("booking-history")) {
			request.setAttribute("views", "/views/src/page/BookingHistoryPage.jsp");
		} else {
			request.setAttribute("views", "/views/src/page/HomePage.jsp");
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
