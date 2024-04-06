<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="My Profile" />
	<jsp:param name="breadcrumb" value="Profile" />
</jsp:include>

<div class="container-fluid destination pt-4">
	<div class="row rounded-top overflow-hidden"
		style="background: url('./views/src/img/bg2.jpg'); background-size: cover">
		<div class="col-lg-6 position-relative">
			<div
				class="rounded-circle position-absolute top-50 translate-middle text-center d-flex justify-content-end align-items-center"
				style="height: 160%; width: 150%; left: 10%; background: rgba(0, 0, 0, 0.05);">
				<h2 style="margin-right: 10rem" class="text-light">Update Your
					Profile</h2>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="border rounded"
				style="margin-top: 10rem; margin-bottom: 10rem">
				<div class="p-3">
					<h3 class="text-light">Update Profile</h3>
					<form>
						<div class="row mb-3">
							<div class="col-sm-4">
								<div class="p-1 border border-2 rounded-2 bg-light">
									<div class="ratio ratio-1x1">
										<img alt="" src="./views/src/img/bg2.jpg"
											class="img-fluid rounded-2">
									</div>
								</div>
							</div>
							<div class="col-sm-8 pb-0">
								<div class="row mb-3">
									<div class="col-sm-6">
										<label class="form-label text-light">First Name:</label> <input
											type="text" class="form-control" name="firstName"
											value="${sessionScope.user.firstName}" />
									</div>
									<div class="col-sm-6">
										<label class="form-label text-light">Last Name:</label> <input
											type="text" class="form-control" name="lastName"
											value="${sessionScope.user.lastName}" />
									</div>
								</div>

								<div class="mb-3">
									<label class="form-label text-light">Email:</label> <input
										type="email" class="form-control" id="email" name="email"
										value="${sessionScope.user.email}" />
								</div>
								<div class="mt-4">
									<select class="form-select "
										aria-label="Default select example">
										<option selected>Select Your Gender?</option>
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="other">Other</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label class="form-label text-light">Phone:</label> <input
								type="text" class="form-control" name="phoneNumber"
								id="phoneNumber" placeholder="Your Phone?" value="${sessionScope.user.phone}" />
						</div>
						<div class="mb-3">
							<label class="form-label text-light">Birthday:</label> <input
								type="date" class="form-control" id="dateOut" name="dateOut" />
						</div>
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>