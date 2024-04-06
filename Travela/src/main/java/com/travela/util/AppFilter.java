package com.travela.util;

import java.io.IOException;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(filterName = "AppFilter", urlPatterns = {"/*"}, dispatcherTypes = DispatcherType.REQUEST)
public class AppFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		RRShare.add(req, resp);
		chain.doFilter(req, resp);
		RRShare.remove();
	}
}