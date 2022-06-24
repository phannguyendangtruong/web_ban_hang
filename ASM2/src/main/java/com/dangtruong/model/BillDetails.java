package com.dangtruong.model;


import java.io.Serializable;
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
import javax.persistence.UniqueConstraint;

import lombok.Data;
import net.bytebuddy.utility.nullability.MaybeNull;


@Data
@Entity
@Table(name = "billdetails", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"billid","productid"})
})
public class BillDetails implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "billdetailsid")
	private long billdetailId;
	@ManyToOne @JoinColumn(name="productid")
	Product product;
	@ManyToOne @JoinColumn(name="billid")
	Bills bills;
	@Column(name="brandid")
	private int brandid;
	private int quantity;

}
