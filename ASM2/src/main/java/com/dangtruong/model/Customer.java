package com.dangtruong.model;

import java.io.Serializable;
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
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@Table(name = "customer")
public class Customer implements Serializable{
	@Id
	@Column(name="username")
	private String username;
	@Column(name="customername")
	private String customerName;
	@Column(name="password")
	private String password;	
	@Column(name="birthday")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	@Column(name="email")
	private String email;
	@Column(name="phone")
	private String phone;
	@Column(name="address")
	private String address;
	@Column(name="gender")
	private boolean gender;
	@Column(name="image")
	private String image;
	@OneToMany(mappedBy = "customer")
	List<Bills> bills;
	
}
