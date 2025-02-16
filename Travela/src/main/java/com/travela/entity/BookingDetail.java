package com.travela.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the booking_detail database table.
 * 
 */
@Entity
@Table(name="booking_detail")
@NamedQuery(name="BookingDetail.findAll", query="SELECT b FROM BookingDetail b")
public class BookingDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="booking_detail_id")
	private String bookingDetailId;

	private double price;

	@Column(name="quantity_booking_room")
	private int quantityBookingRoom = 0;

	//bi-directional many-to-one association to Booking
	@ManyToOne
	@JoinColumn(name="booking_id")
	private Booking booking;

	//bi-directional many-to-one association to Room
	@ManyToOne
	@JoinColumn(name="room_id")
	private Room room;

	public BookingDetail() {
	}

	public String getBookingDetailId() {
		return this.bookingDetailId;
	}

	public void setBookingDetailId(String bookingDetailId) {
		this.bookingDetailId = bookingDetailId;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantityBookingRoom() {
		return this.quantityBookingRoom;
	}

	public void setQuantityBookingRoom(int quantityBookingRoom) {
		this.quantityBookingRoom = quantityBookingRoom;
	}

	public Booking getBooking() {
		return this.booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}


}