<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row m-0 d-flex justify-content-center h-100">
	<div class="col col-lg-12 p-0">
		<div class="card h-100" style="border: none">
			<div class="row g-0 h-100">
				<div class="col-md-6 col-lg-6 d-none d-md-block"
					style="background-image: url('./views/src/img/login.jpg'); background-size: cover;"></div>
				<div class="col-md-6 col-lg-6 d-flex align-items-center">
					<div class="card-body p-4 p-lg-5 pt-lg-2 text-black">
						<form method="post" action="/Travela/login">
							<div class="d-flex align-items-center mb-3 pb-1">
								<h1 class="m-0">
									<i class="fa fa-map-marker-alt me-3" style="color: #2e70d2"></i>Travela
								</h1>
							</div>

							<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px">
								Sign into your account</h5>
							
							<c:if test="${not empty requestScope.wrongMessage}">
								<div class="alert alert-danger">${requestScope.wrongMessage}</div>
							</c:if>
							
							<div class="form-outline mb-4">
								<label class="form-label" for="form2Example17">Email
									address</label> <input type="email" name="email"
									class="form-control form-control-lg" placeholder="Your Email" required />
							</div>

							<div class="form-outline mb-4">
								<label class="form-label" for="form2Example27">Password</label>
								<input type="password" name="password"
									class="form-control form-control-lg" placeholder="Password" required />
							</div>
							<div class="d-flex justify-content-between">
								<p class="pb-lg-2" style="color: #393f81">
									Don't have an account? <a href="#!" style="color: #393f81">Register
										here</a>
								</p>
								<a class="small text-muted" href="#!">Forgot password?</a>
							</div>
							<div class="pt-1 mb-4">
								<button class="btn btn-dark btn-lg btn-block w-100"
									type="submit">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
