package com.travela.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.travela.dao.impl.UserDAOImpl;
import com.travela.entity.User;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet(urlPatterns = {})
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAOImpl = new UserDAOImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AuthServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String method = request.getMethod();
		if (method.toLowerCase().contains("get")) {
			if (uri.contains("login")) {
				request.setAttribute("LoginPage", true);
			} else if (uri.contains("register")) {
				request.setAttribute("RegisterPage", true);
			} else if (uri.contains("forgotpassword")) {
				request.setAttribute("ForgotPasswordPage", true);
			}
			doGet(request, response);
		} else {

			if (uri.contains("login")) {
				doLogin(request, response);
			} else if (uri.contains("register")) {
				doRegister(request, response);
			} else if (uri.contains("forgotpassword")) {
				request.setAttribute("ForgotPasswordPage", true);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User loginUser = userDAOImpl.findByEmailAndPassword(email, password);

		if (loginUser != null) {
			request.getSession().setAttribute("user", loginUser);
			response.sendRedirect("/Travela/home");
		} else if (loginUser == null) {
			request.setAttribute("wrongMessage", "Something wrong please check again your form!!!");
			request.setAttribute("LoginPage", true);
			doGet(request, response);
		}
	}

	public void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		User registerUser = new User();
		try {
			BeanUtils.populate(registerUser, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userDAOImpl.create(registerUser) != null) {
			request.getSession().setAttribute("user", registerUser);
			response.sendRedirect("/Travela/home");
		} else {
			request.setAttribute("wrongMessage", "Something wrong please check again your form!!!");
			request.setAttribute("RegisterPage", true);
			doGet(request, response);
		}
	}
}