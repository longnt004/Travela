<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<div class="carousel-header">
	<%!public class CarouselItem {
		public String imgURL;
		public String title;

		public CarouselItem(String imgURL, String title) {
			this.imgURL = imgURL;
			this.title = title;
		}

		public String getImgURL() {
			return this.imgURL;
		}

		public String getTitle() {
			return this.title;
		}
	}

	List<CarouselItem> listCarouselItem = new ArrayList<>(
			List.of(new CarouselItem("./views/src/img/bg1.jpg", "Let's The World Together!"),
					new CarouselItem("./views/src/img/bg2.jpg", "Perfect Tour"),
					new CarouselItem("./views/src/img/bg3.jpg", "You Like To Go?")));%>

	<div id="carouselId" class="carousel slide" data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<c:forEach var="carouselItem" items="<%=listCarouselItem%>"
				varStatus="loop">

				<c:choose>
					<c:when test="${loop.index == 0}">
						<li data-bs-target="#carouselId" data-bs-slide-to="${loop.index}"
							class="active"></li>
					</c:when>
					<c:otherwise>
						<li data-bs-target="#carouselId" data-bs-slide-to="${loop.index}"></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach var="carouselItem" items="<%=listCarouselItem%>"
				varStatus="loop">
				<c:choose>
					<c:when test="${loop.index == 0}">
						<div class="carousel-item active">
							<img src="${carouselItem.getImgURL()}" class="img-fluid"
								alt="Image" />
							<div class="carousel-caption">
								<div class="p-3" style="max-width: 900px">
									<h4 class="text-white text-uppercase fw-bold mb-4"
										style="letter-spacing: 3px">Explore The World</h4>
									<h1 class="display-2 text-capitalize text-white mb-4">${carouselItem.getTitle()}</h1>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
							<img src="${carouselItem.getImgURL()}" class="img-fluid"
								alt="Image" />
							<div class="carousel-caption">
								<div class="p-3" style="max-width: 900px">
									<h4 class="text-white text-uppercase fw-bold mb-4"
										style="letter-spacing: 3px">Explore The World</h4>
									<h1 class="display-2 text-capitalize text-white mb-4">${carouselItem.getTitle()}</h1>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselId" data-bs-slide="prev">
			<span class="carousel-control-prev-icon btn bg-primary"
				aria-hidden="false"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselId" data-bs-slide="next">
			<span class="carousel-control-next-icon btn bg-primary"
				aria-hidden="false"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>
</div>