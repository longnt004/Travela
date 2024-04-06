package com.travela.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the booking database table.
 * 
 */
@Entity
@Table(name="booking")
@NamedQuery(name="Booking.findAll", query="SELECT b FROM Booking b")
public class Booking implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="booking_id")
	private String bookingId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="booking_date")
	private Date bookingDate = new Date();

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="check_in")
	private Date checkIn;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="check_out")
	private Date checkOut;

	@Column(name="payment_status")
	private boolean paymentStatus = false;

	private String status = "PENDING";

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	//bi-directional many-to-one association to BookingDetail
	@OneToMany(mappedBy="booking")
	private List<BookingDetail> bookingDetails;

	public Booking() {
	}

	public String getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public Date getBookingDate() {
		return this.bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getCheckIn() {
		return this.checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return this.checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public boolean getPaymentStatus() {
		return this.paymentStatus;
	}

	public void setPaymentStatus(boolean paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<BookingDetail> getBookingDetails() {
		return this.bookingDetails;
	}

	public void setBookingDetails(List<BookingDetail> bookingDetails) {
		this.bookingDetails = bookingDetails;
	}

	public BookingDetail addBookingDetail(BookingDetail bookingDetail) {
		getBookingDetails().add(bookingDetail);
		bookingDetail.setBooking(this);

		return bookingDetail;
	}

	public BookingDetail removeBookingDetail(BookingDetail bookingDetail) {
		getBookingDetails().remove(bookingDetail);
		bookingDetail.setBooking(null);

		return bookingDetail;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", bookingDate=" + bookingDate + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", paymentStatus=" + paymentStatus + ", status=" + status + ", user="
				+ user + ", bookingDetails=" + bookingDetails + "]";
	}
	
	

}