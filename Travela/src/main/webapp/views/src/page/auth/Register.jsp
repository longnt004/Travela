<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row d-flex justify-content-center m-0">
	<div class="col col-lg-12 p-0">
		<div class="card" style="border: none">
			<div class="row g-0">
				<div class="col-md-6 col-lg-6 d-flex p-0">
					<div class="card-body p-0 text-black">
						<form class="p-5" method="post" action="/Travela/register">
							<div class="d-flex align-items-center mb-3">
								<h1 class="m-0">
									<i class="fa fa-map-marker-alt me-3" style="color: #2e70d2"></i>Travela
								</h1>
							</div>

							<h5 class="fw-normal pb-3" style="letter-spacing: 1px">Create
								your account to join us</h5>

							<c:if test="${requestScope.wrongMessage != null}">
								<div class="alert alert-danger">${requestScope.wrongMessage}</div>
							</c:if>

							<div class="row mb-3">
								<div class="col-lg-6">
									<div class="form-outline">
										<label class="form-label" for="form2Example17">First
											Name</label> <input type="text" name="firstName"
											class="form-control form-control-lg"
											placeholder="Your First Name?" required />
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-outline">
										<label class="form-label" for="form2Example17">Last
											Name</label> <input type="text" name="lastName"
											class="form-control form-control-lg"
											placeholder="Your Last Name?" required />
									</div>
								</div>
							</div>

							<div class="form-outline mb-3">
								<label class="form-label" for="form2Example17">Email
									address</label> <input type="email" name="email"
									class="form-control form-control-lg" placeholder="Your Email?"
									required />
							</div>

							<div class="form-outline mb-3">
								<label class="form-label" for="form2Example27">Password</label>
								<input type="password" name="password"
									class="form-control form-control-lg"
									placeholder="Your Password?" required />
							</div>
							<div class="form-outline mb-3">
								<label class="form-label" for="form2Example27">Confirm
									password</label> <input type="password" name="confirmPassword"
									class="form-control form-control-lg"
									placeholder="Confirm your password" required />
							</div>
							<div class="form-outline mb-3">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>

							<div class="pt-1 mb-4">
								<button class="btn btn-dark btn-lg btn-block w-100"
									type="submit">Register</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-6 col-lg-6 d-none d-md-block"
					style="background-image: url('./views/src/img/regis.jpg'); background-size: cover;"></div>
			</div>
		</div>
	</div>
</div>