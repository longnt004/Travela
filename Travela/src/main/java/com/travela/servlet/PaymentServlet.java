package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.travela.config.VNPAYConfig;
import com.travela.paymentservice.PaymentService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet({"/payment-vnpay", "/payment-paypal"})
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		if(uri.contains("vnpay")) {
			PaymentService.VNPay(req, resp);
		} else if (uri.contains("paypal")){
			PaymentService.PayPal(req, resp);
		}
	}
}
