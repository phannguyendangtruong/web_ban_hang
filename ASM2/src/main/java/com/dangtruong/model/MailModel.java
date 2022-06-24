package com.dangtruong.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailModel {
	String from = "Dang Truong Store";
	String to;
	String subject;
	String body;
	List<String> cc = new ArrayList<String>();
	List<String> bcc = new ArrayList<String>();
	List<File> files = new ArrayList<File>();
	
	public MailModel(String to, String subject, String body) {
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}
