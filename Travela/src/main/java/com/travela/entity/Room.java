package com.travela.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the rooms database table.
 * 
 */
@Entity
@Table(name="rooms")
@NamedQuery(name="Room.findAll", query="SELECT r FROM Room r")
public class Room implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="room_id")
	private String roomId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	private String description;

	private String image;

	private double price;

	@Column(name="room_area")
	private String roomArea;

	@Column(name="room_bed")
	private String roomBed;

	private boolean status;

	private String title;

	//bi-directional many-to-one association to BookingDetail
	@OneToMany(mappedBy="room")
	private List<BookingDetail> bookingDetails;

	//bi-directional many-to-one association to RoomDetail
	@OneToMany(mappedBy="room")
	private List<RoomDetail> roomDetails;

	public Room() {
	}

	public String getRoomId() {
		return this.roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getRoomArea() {
		return this.roomArea;
	}

	public void setRoomArea(String roomArea) {
		this.roomArea = roomArea;
	}

	public String getRoomBed() {
		return this.roomBed;
	}

	public void setRoomBed(String roomBed) {
		this.roomBed = roomBed;
	}

	public boolean getStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<BookingDetail> getBookingDetails() {
		return this.bookingDetails;
	}

	public void setBookingDetails(List<BookingDetail> bookingDetails) {
		this.bookingDetails = bookingDetails;
	}

	public BookingDetail addBookingDetail(BookingDetail bookingDetail) {
		getBookingDetails().add(bookingDetail);
		bookingDetail.setRoom(this);

		return bookingDetail;
	}

	public BookingDetail removeBookingDetail(BookingDetail bookingDetail) {
		getBookingDetails().remove(bookingDetail);
		bookingDetail.setRoom(null);

		return bookingDetail;
	}

	public List<RoomDetail> getRoomDetails() {
		return this.roomDetails;
	}

	public void setRoomDetails(List<RoomDetail> roomDetails) {
		this.roomDetails = roomDetails;
	}

	public RoomDetail addRoomDetail(RoomDetail roomDetail) {
		getRoomDetails().add(roomDetail);
		roomDetail.setRoom(this);

		return roomDetail;
	}

	public RoomDetail removeRoomDetail(RoomDetail roomDetail) {
		getRoomDetails().remove(roomDetail);
		roomDetail.setRoom(null);

		return roomDetail;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", createDate=" + createDate + ", description=" + description + ", image="
				+ image + ", price=" + price + ", roomArea=" + roomArea + ", roomBed=" + roomBed + ", status=" + status
				+ ", title=" + title + ", bookingDetails=" + bookingDetails + ", roomDetails=" + roomDetails + "]";
	}

	
	
}