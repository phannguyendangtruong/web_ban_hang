package com.dangtruong.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
@Entity
@Table(name = "promotionalcode")
public class PromotionalCode {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promotionalcodeid")
	private int promotionalCodeId;
	@Column(name = "promotionalcodedate")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date promotionalCodeDate;
	@Column(name = "percentagereduction")
	private int percentageRedution;
	private String code;
	
}
