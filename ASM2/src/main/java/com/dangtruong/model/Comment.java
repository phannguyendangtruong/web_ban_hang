package com.dangtruong.model;

import java.util.Date;
import java.util.List;

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
@Table(name = "comment")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentId;
	private String content;
	@ManyToOne @JoinColumn(name="productId")
	private Product product;
	@ManyToOne @JoinColumn(name="customerid")
	private Customer customer;
	private Date cmtDate;
	private boolean isDeleted = false;
}
