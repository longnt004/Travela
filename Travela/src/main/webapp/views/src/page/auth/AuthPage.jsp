<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="vh-80" style="background-color: #5081cb">
	<div class="container py-5 h-80">
		<div class="row d-flex justify-content-center align-items-center h-80">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem">
					<div class="row g-0">
						<c:choose>
							<c:when test="${requestScope.LoginPage}">
								<%@ include file="./Login.jsp"%>
							</c:when>
							<c:when test="${requestScope.RegisterPage}">
								<%@ include file="./Register.jsp"%>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>