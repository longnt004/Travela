<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-lg-12 d-flex flex-column gap-2">
	<div class="border rounded gap-2 py-3">
		<div class="d-flex justify-content-between px-5">
			<div class="row">
				<div class="col-xl-4">
					<a href="/Travela/roomdetails"> <img class="img-fluid rounded"
						height="100" src="${param.imgURL}" alt="" />
					</a>
				</div>
				<div class="col-lg-8">
					<div class="d-flex justify-content-between px-3 py-3">
						<div>
							<h2>${param.title}</h2>
						</div>
						<div class="align-self-end">
							<h5>
								${param.price} <span class="fs-6">$</span>/Night
							</h5>
						</div>
					</div>
					<span class="d-block border border-2 rounded"></span>
					<div class="p-2">
						<p class="m-0 fs-5">${param.description}</p>
					</div>
					<div class="p-2 row">
						<jsp:include page="./Service.jsp">
							<jsp:param name="icon" value="<i class='fas fa-wind'></i>" />
							<jsp:param name="title" value=" Air conditioning" />
						</jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>