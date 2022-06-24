package com.dangtruong.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Table(name="bill")
public class Bills {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int billid;
	@ManyToOne @JoinColumn(name="usernamecustomer")
	Customer customer;
	@Column(name = "fullname")
	private String fullname;
	@Column(name = "address")
	private String address;
	@Column(name = "billdate")
	private Date billDate = new Date();
	@Column(name = "totalprice")
	private int totalPrice ;
	@ManyToOne @JoinColumn(name="staffusername")
	Staff staff;
	@Column(name = "isdeleted")
	private boolean isDeleted = false;
	@Column(name = "confirm")
	private boolean confirm = false;
	@OneToMany(mappedBy = "bills")
	List<BillDetails> billDetails;
}
