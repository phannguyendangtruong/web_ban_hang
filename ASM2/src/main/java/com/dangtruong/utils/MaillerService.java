package com.dangtruong.utils;

import javax.mail.MessagingException;

import com.dangtruong.model.MailInfo;

public interface MaillerService {
	void send(MailInfo mail)throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	void queue(MailInfo mail);
	void queue(String to, String subject, String body);
}
