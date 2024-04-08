package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.travela.dao.impl.BookingDAOImpl;
import com.travela.entity.Booking;
import com.travela.entity.BookingDetail;

/**
 * Servlet implementation class HistoryBookingController
 */
@WebServlet({"/booking-history/detail-booking","/booking-history/cancel-booking"})
public class HistoryBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BookingDAOImpl bookingDAOImpl = new BookingDAOImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryBookingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		String uri = request.getRequestURI();
		if (method.equalsIgnoreCase("Get")) {
			if(uri.contains("detail-booking")) {
				String bId = request.getParameter("bId");
				Booking booking = bookingDAOImpl.findById(bId);
				List<BookingDetail> historybookingDetailList = booking.getBookingDetails();

				request.getSession().setAttribute("historybookingDetailList", historybookingDetailList);
			} else if(uri.contains("cancel-booking")) {
				String bId = request.getParameter("bId");
				Booking booking = bookingDAOImpl.findById(bId);
				booking.setStatus("CANCEL");
				bookingDAOImpl.update(booking);
				request.getSession().setAttribute("historybookingDetailList", null);
			}
		}
	}

}
