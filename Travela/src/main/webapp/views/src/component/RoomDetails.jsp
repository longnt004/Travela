<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!public class Service {
		private String icon;
		private String title;

		public Service(String icon, String title) {
			this.icon = icon;
			this.title = title;
		}

		public String getIcon() {
			return this.icon;
		}

		public String getTitle() {
			return this.title;
		}
	}

	public class Room {

		private String imgURL;
		private String title;
		private int price;
		private String description;
		private List<Service> listServices;

		public Room(String imgURL, String title, int price, String description, List<Service> listServices) {
			this.imgURL = imgURL;
			this.title = title;
			this.price = price;
			this.description = description;
			this.listServices = listServices;
		}

		public String getImgURL() {
			return this.imgURL;
		}

		public String getTitle() {
			return this.title;
		}

		public int getPrice() {
			return this.price;
		}

		public String getDescription() {
			return this.description;
		}

		public List<Service> getListServices() {
			return this.listServices;
		}
	}

	List<Service> listServices = new ArrayList<>(List.of(new Service("<i class='fas fa-wind'></i>", "Air conditioning"),
			new Service("<i class='fas fa-bed'></i>", "2 Bedroom"),
			new Service("<i class='fas fa-broom'></i>", "Room Service"),
			new Service("<i class='fas fa-newspaper'></i>", "Free Newspaper"),
			new Service("<i class='fas fa-bacon'></i>", "Breakfast"),
			new Service("<i class='fas fa-dumbbell'></i>", "GYM"), new Service("<i class='fas fa-tv'></i>", "TV"),
			new Service("<i class='fas fa-wifi'></i>", "Wifi"),
			new Service("<i class='fas fa-swimmer'></i>", "Use of pool")));

	Room singleRoom = new Room("./views/src/img/sgr3.jpg", "Single Room", 1300,
			"Single rooms are assigned to one people; expect one double bed, or two twin beds depending on the hotel.",
			listServices);%>

<div class="container-fluid destination py-5">
	<div class="row g-4">
		<div class="col-lg-12 d-flex flex-column gap-2">
			<div class="border rounded gap-2 py-3">
				<div class="d-flex justify-content-between px-5">
					<div class="row">
						<div class="col-xl-2">
							<img class="img-fluid rounded" height="100"
								src="<%=singleRoom.getImgURL()%>" alt="" />
						</div>
						<div class="col-lg-10">
							<div class="d-flex justify-content-between px-3 py-3">
								<div>
									<h2>Single Room</h2>
								</div>
								<div class="align-self-end">
									<h5>
										<%=singleRoom.getPrice()%>
										<span class="fs-6">$</span>/Night
									</h5>
								</div>
							</div>
							<span class="d-block border border-2 rounded"></span>
							<div class="d-flex pt-3 ps-2 gap-4">
								<div>
									<i class="fas fa-bed"></i> 2 Bed
								</div>
								<div>
									<i class="fas fa-tv"></i> TV
								</div>
								<div>
									<i class="fas fa-dumbbell"></i> GYM
								</div>
								<div>
									<i class="fas fa-wifi"></i> Wifi
								</div>
								<div>
									<i class="fas fa-parking"></i> Parking
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="p-4">
					<div class="row">
						<div class="col-lg-6">
							<h4 class="fst-italic">Room Description</h4>
							<div class="pt-2">
								<div>
									<p>
										<%=singleRoom.getDescription()%>
									</p>
									<div>
										<div>
											<p>
												<i class="fas fa-hand-point-right"></i> Max Adult: 2
											</p>
										</div>
										<div>
											<p>
												<i class="fas fa-hand-point-right"></i> Max Children: 2
											</p>
										</div>
										<div>
											<p>
												<i class="fas fa-hand-point-right"></i> Room Facility: 24 Hr
												Room Service
											</p>
										</div>
									</div>
								</div>
							</div>
							<div>
								<div class="pt-4">
									<h4 class="fst-italic">Amenities</h4>
									<div class="p-2 row">
										<c:forEach var="service"
											items="<%=singleRoom.getListServices()%>">
											<jsp:include page="/views/src/component/Service.jsp">
												<jsp:param name="icon" value="${service.getIcon()}" />
												<jsp:param name="title" value="${service.getTitle()}" />
											</jsp:include>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="border rounded">
								<div class="p-3">
									<h3>Fill Booking Details</h3>
									<form>
										<div class="mb-3">
											<input type="text" class="form-control" id="name" name="name" />
										</div>
										<div class="mb-3">
											<input type="text" class="form-control" name="phoneNumber"
												id="phoneNumber" />
										</div>
										<div class="mb-3">
											<input type="email" class="form-control" id="email"
												name="email" />
										</div>
										<div class="mb-3">
											<div class="row">
												<div class="col-lg-6">
													<select name="idType" id="idType" class="form-select">
														<option value="">Choose ID Type</option>
														<option value="volvo">Volvo</option>
														<option value="saab">Saab</option>
														<option value="mercedes">Mercedes</option>
														<option value="audi">Audi</option>
													</select>
												</div>
												<div class="col-lg-6">
													<select name="gender" id="gender" class="form-select">
														<option value="">Select Gender</option>
														<option value="male">Male</option>
														<option value="female">Female</option>
														<option value="other">Other</option>
													</select>
												</div>
											</div>
										</div>
										<div class="mb-3">
											<textarea class="form-control" id="address" name="address"
												rows="3" placeholder="Address"></textarea>
										</div>
										<div class="mb-3">
											<input type="date" class="form-control" id="dateIn"
												name="dateIn" />
										</div>
										<div class="mb-3">
											<input type="date" class="form-control" id="dateOut"
												name="dateOut" />
										</div>
										<button type="submit" class="btn btn-primary">Book
											Now</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>