package com.dangtruong.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name ="Staff")
public class Staff implements Serializable{
	@Id
	@Column(name="username")
	private String username;
	@Column(name="fullname")
	private String fullName;
	@Column(name="password")
	private String password;
	@Column(name="birthday")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	@Column(name="gender")
	private boolean gender;
	@Column(name="phone")
	private String phone;
	@Column(name="email")
	private String email;
	@Column(name="address")
	private String address;
	@Column(name="admin")
	private boolean admin = true;
	@Column(name="isdeleted")
	private boolean isDeleted = false;
	@OneToMany(mappedBy = "staff")
	List<Bills> bill;
}
