package com.travela.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the room_detail database table.
 * 
 */
@Entity
@Table(name="room_detail")
@NamedQuery(name="RoomDetail.findAll", query="SELECT r FROM RoomDetail r")
public class RoomDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="room_detail_id")
	private String roomDetailId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	//bi-directional many-to-one association to Facility
	@ManyToOne
	@JoinColumn(name="facinities_id")
	private Facility facility;

	//bi-directional many-to-one association to Room
	@ManyToOne
	@JoinColumn(name="room_id")
	private Room room;

	public RoomDetail() {
	}

	public String getRoomDetailId() {
		return this.roomDetailId;
	}

	public void setRoomDetailId(String roomDetailId) {
		this.roomDetailId = roomDetailId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Facility getFacility() {
		return this.facility;
	}

	public void setFacility(Facility facility) {
		this.facility = facility;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

}