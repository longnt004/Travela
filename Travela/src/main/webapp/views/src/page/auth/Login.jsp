<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-6 col-lg-5 d-none d-md-block">
	<img
		src="https://images.pexels.com/photos/2033997/pexels-photo-2033997.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
		alt="login form" class="img-fluid"
		style="border-radius: 1rem 0 0 1rem" />
</div>
<div class="col-md-6 col-lg-7 d-flex align-items-center">
	<div class="card-body p-4 p-lg-5 text-black">
		<form method="post">
			<div class="d-flex align-items-center mb-3 pb-1">
				<h1 class="m-0">
					<i class="fa fa-map-marker-alt me-3" style="color: #2e70d2"></i>Travela
				</h1>
			</div>

			<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px">
				Sign into your account</h5>

			<c:if test="${requestScope.wrongMessage != null}">
				<div class="alert alert-danger">${requestScope.wrongMessage}</div>
			</c:if>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example17">Email address</label>
				<input type="email" id="form2Example17"
					class="form-control form-control-lg" placeholder="Your Email"
					name="email" required />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example27">Password</label> <input
					type="password" id="form2Example27"
					class="form-control form-control-lg" placeholder="Password"
					name="password" required />
			</div>

			<div class="pt-1 mb-4">
				<button class="btn btn-dark btn-lg btn-block" type="submit">
					Login</button>
			</div>

			<a class="small text-muted" href="#!">Forgot password?</a>
			<p class="mb-5 pb-lg-2" style="color: #393f81">
				Don't have an account? <a href="/Travela/register"
					style="color: #393f81">Register here</a>
			</p>
		</form>
		<div></div>
	</div>
</div>