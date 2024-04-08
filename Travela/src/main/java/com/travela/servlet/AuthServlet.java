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
import com.travela.util.TravelaUtil;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet(urlPatterns = { "/register", "/forgotPassword", "/logout" })
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
		if (uri.contains("login")) {
			doLogin(request, response);
		} else if (uri.contains("register")) {
			doRegister(request, response);
		} else if (uri.contains("forgotPassword")) {
			if (request.getParameter("vc") != null) {
				request.setAttribute("isValidate", "isValidate");
			}
			doForgotPassword(request, response);
		} else if (uri.contains("logout")) {
			doLogout(request, response);
		}
//		String method = request.getMethod();
//		if (method.toLowerCase().contains("get")) {
//			String authViews = "/views/src/page/auth/Login.jsp";
//			if (uri.contains("login")) {
//				request.setAttribute("authViews", "/views/src/page/auth/Login.jsp");
//			} else if (uri.contains("register")) {
//				authViews = "/views/src/page/auth/Register.jsp";
//			} else if (uri.contains("forgotPassword")) {
//				if (request.getParameter("vc") != null) {
//					request.setAttribute("isValidate", "isValidate");
//				}
//				authViews = "/views/src/page/auth/ForgotPass.jsp";
//			}
//			request.setAttribute("authViews", authViews);
//			doGet(request, response);
//		} else {
//			if (uri.contains("login")) {
//				doLogin(request, response);
//			} else if (uri.contains("register")) {
//				doRegister(request, response);
//			} else if (uri.contains("forgotPassword")) {
//				doForgotPassword(request, response);
//			} else if (uri.contains("logout")) {
//				doLogout(request, response);
//			}
//		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("Post")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			User loginUser = userDAOImpl.findByEmailAndPassword(email, password);

			if (loginUser != null) {
				request.getSession().setAttribute("user", loginUser);
				response.sendRedirect("/Travela/home");
			} else if (loginUser == null) {
				request.setAttribute("wrongMessage", "Something wrong please check again your form!!!");
				request.setAttribute("authViews", "/views/src/page/auth/Login.jsp");
				doGet(request, response);
			}
		} else {
			request.setAttribute("authViews", "/views/src/page/auth/Login.jsp");
			doGet(request, response);
		}
	}

	public void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("Post")) {
			User registerUser = new User();

			try {
				BeanUtils.populate(registerUser, request.getParameterMap());
				registerUser.setUserId(TravelaUtil.GenerateId(userDAOImpl.findLastOne().getUserId()));
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (userDAOImpl.create(registerUser) != null) {
				request.getSession().setAttribute("user", registerUser);
				response.sendRedirect("/Travela/home");
			} else {
				request.setAttribute("wrongMessage", "Something wrong please check again your form!!!");
				request.setAttribute("authViews", "/views/src/page/auth/Register.jsp");
				doGet(request, response);
			}
		} else {
			request.setAttribute("authViews", "/views/src/page/auth/Register.jsp");
			doGet(request, response);
		}
	}

	public void doForgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("Post")) {
			String forgotEmail = request.getParameter("email");
			System.out.println(forgotEmail);
			TravelaUtil.SendMail(forgotEmail);
			request.setAttribute("ForgotPassword", true);
		}
		request.setAttribute("authViews", "/views/src/page/auth/ForgotPass.jsp");
		doGet(request, response);
	}

	public void doLogout(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.getSession().setAttribute("user", null);
		response.sendRedirect("/Travela/home");
	}
}