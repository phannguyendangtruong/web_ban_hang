package com.dangtruong.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "brand")
public class Brand implements Serializable{
	@Id
	@Column(name="brandid")
	private int brandId;
	@Column(name="brandname")
	private String brandName;
	@OneToMany (mappedBy  = "brand")
	List<Product> products;
}
