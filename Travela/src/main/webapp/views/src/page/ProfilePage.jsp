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
						<div class="mb-3">
							<input type="text" class="form-control" id="name" name="name" />
						</div>
						<div class="mb-3">
							<input type="text" class="form-control" name="phoneNumber"
								id="phoneNumber" />
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" id="email" name="email" />
						</div>
						<div class="mb-3">
							<input type="date" class="form-control" id="dateOut"
								name="dateOut" />
						</div>
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>