package com.travela.util;

import java.io.IOException;

import com.travela.entity.User;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "/home", "/rooms", "/tour", "/roomdetails" , "/profile" })
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		User user = (User) req.getSession().getAttribute("user");
		req.setAttribute("user", user);
		if (user == null) {
			resp.sendRedirect("/Travela/login");
		} else {
			chain.doFilter(req, resp);
		}
	}
}
