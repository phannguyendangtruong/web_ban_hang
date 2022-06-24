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
import lombok.Data;


@Data
@Entity
@Table(name="product")
public class Product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="productid")
	private int productId;
	@Column(name="productname")
	private String productName;
	@Column(name="description")
	private String description;
	@Column(name="price")
	private int price;
	@Column(name="datesubmited")
	private Date dateSubmited = new Date();
	@Column(name="quantity")
	private int quantity;
	@Column(name="previousimg")
	private String previousImg;
	@Column(name="backsidephoto")
	private String backSidePhoto;
	@Column(name="isdeleted")
	private boolean isDeleted = false;
	@ManyToOne @JoinColumn(name="brandid")
	Brand brand;
	@OneToMany(mappedBy = "product")
	List<BillDetails> billDetails;
	@OneToMany(mappedBy = "product")
	List<Comment> comment;
}
