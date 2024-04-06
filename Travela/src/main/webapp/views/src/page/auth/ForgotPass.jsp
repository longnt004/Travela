<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row d-flex justify-content-center m-0 h-100">
	<div class="col col-lg-12 p-0">
		<div class="card h-100" style="border: none">
			<div class="row g-0 h-100">
				<div class="col-md-6 col-lg-6 d-none d-md-block"
					style="background-image: url('./views/src/img/logo.webp'); background-size: cover;">
				</div>
				<div class="col-md-6 col-lg-6 d-flex pt-5">
					<div class="card-body p-5 text-black">
						<form class="pt-5" method="post">
							<div class="d-flex align-items-center mb-3">
								<c:if test="${not empty isValidate}">
									<div class="alert alert-success" role="alert">${isValidate}</div>
								</c:if>
								<h1 class="m-0">
									<i class="fa fa-map-marker-alt me-3" style="color: #ff0000"></i>Travela
								</h1>
							</div>

							<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px">
								Account recovery</h5>
							<label class="form-label" for="form2Example17">Email
								address</label>
							<div class="form-outline d-flex bd-highlight gap-3 mb-3">
								<input type="email" name="email"
									class="form-control form-control-lg flex-grow-1 bd-highlight"
									placeholder="Your Email" />
								<button type="submit"
									class="btn btn-outline-primary bd-highlight">Send</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>