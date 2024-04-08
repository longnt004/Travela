package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import com.travela.dao.impl.BookingDAOImpl;
import com.travela.dao.impl.BookingDetailDAOImpl;
import com.travela.dao.impl.RoomDAOImpl;
import com.travela.entity.Booking;
import com.travela.entity.BookingDetail;
import com.travela.entity.User;
import com.travela.util.TravelaUtil;

/**
 * Servlet implementation class RoomServlet
 */
@WebServlet({ "/room/add-room", "/room/cancel-room", "/room/minus-room", "/room/booking" })
public class RoomsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookingDetailDAOImpl bookingDetailDAOImpl = new BookingDetailDAOImpl();

	private RoomDAOImpl roomDAOImpl = new RoomDAOImpl();

	private BookingDAOImpl bookingDAOImpl = new BookingDAOImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		String uri = request.getRequestURI();
		User user = (User) request.getSession().getAttribute("user");
		Map<String, Map<String, BookingDetail>> allBookingDetailMap = (Map<String, Map<String, BookingDetail>>) request
				.getSession().getAttribute("allBookingDetailMap");
		if (allBookingDetailMap == null) {
			allBookingDetailMap = new HashMap<>();
		}

		Map<String, BookingDetail> bookingDetailMap = allBookingDetailMap.get(user.getUserId());
		if (method.equalsIgnoreCase("Get")) {
			if (!uri.contains("booking")) {
				String roomId = request.getParameter("rId");
				BookingDetail bookingDetail = new BookingDetail();

				if (bookingDetailMap == null) {
					bookingDetailMap = new HashMap<>();
				} else {
					if (bookingDetailMap.get(roomId) != null) {
						bookingDetail = bookingDetailMap.get(roomId);
					}
				}

				if (bookingDetail.getBookingDetailId() == null) {
					bookingDetail.setRoom(roomDAOImpl.findById(roomId));
					bookingDetail.setPrice(roomDAOImpl.findById(roomId).getPrice());
				}

				if (uri.contains("add-room")) {
					bookingDetail.setQuantityBookingRoom(bookingDetail.getQuantityBookingRoom() + 1);

					bookingDetailMap.put(roomId, bookingDetail);
				} else if (uri.contains("minus-room")) {
					int quantityBookingRoom = bookingDetailMap.get(request.getParameter("rId"))
							.getQuantityBookingRoom();
					if (quantityBookingRoom - 1 == 0) {
						bookingDetailMap.remove(request.getParameter("rId"));
					} else {
						bookingDetail.setQuantityBookingRoom(bookingDetail.getQuantityBookingRoom() - 1);
						bookingDetailMap.put(request.getParameter("rId"), bookingDetail);
					}
				} else if (uri.contains("cancel-room")) {
					bookingDetailMap.remove(request.getParameter("rId"));
				}

				int totalPrice = 0;
				for (BookingDetail bd : bookingDetailMap.values()) {
					totalPrice += bd.getQuantityBookingRoom() * bd.getPrice();
				}
				allBookingDetailMap.put(user.getUserId(), bookingDetailMap);
				request.getSession().setAttribute("bookingDetailMap", bookingDetailMap);
				request.getSession().setAttribute("totalPrice", totalPrice);
				request.getSession().setAttribute("allBookingDetailMap", allBookingDetailMap);
			} else {
				if (bookingDetailMap != null) {
					Booking booking = new Booking();
					DateConverter dateConverter = new DateConverter();
					dateConverter.setPatterns(new String[] { "yyyy-MM-dd" });
					ConvertUtils.register(dateConverter, Date.class);
					booking.setCheckIn((Date) ConvertUtils.convert(request.getParameter("checkIn"), Date.class));
					booking.setCheckOut((Date) ConvertUtils.convert(request.getParameter("checkOut"), Date.class));
					booking.setBookingId(TravelaUtil.GenerateId(bookingDAOImpl.findLastBooking().getBookingId()));
					booking.setUser((User) request.getSession().getAttribute("user"));
					booking.setBookingDetails(new ArrayList<BookingDetail>(bookingDetailMap.values()));
					booking.setPaymentStatus(Boolean.parseBoolean(request.getParameter("paid")));
					bookingDAOImpl.create(booking);
					for (BookingDetail bd : bookingDetailMap.values()) {
						bd.setBookingDetailId(TravelaUtil
								.GenerateId(bookingDetailDAOImpl.findLastBookingDetail().getBookingDetailId()));
						bd.setBooking(booking);
						bookingDetailDAOImpl.create(bd);
					}
					allBookingDetailMap.put(user.getUserId(), null);
					request.getSession().setAttribute("totalPrice", 0);
					request.getSession().setAttribute("bookingDetailMap", null);
					request.getSession().setAttribute("allBookingDetailMap", allBookingDetailMap);
				}
			}
		}
	}

}
