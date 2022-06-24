package com.dangtruong.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.dangtruong.model.MailInfo;

@Service
public class MaillerServiceIlm implements MaillerService {
	
	List<MailInfo> list = new ArrayList<>();
	
	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfo mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());
		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && cc.length > 0) {
			helper.setBcc(bcc);
		}
		List<File> file = mail.getFiles();
		if (file.size() > 0) {
			for (File files : file) {
				helper.addAttachment(files.getName(), files);
			}
		}
		// Gửi message đến SMTP server
		
		sender.send(message);

	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
			this.send(new MailInfo(to, subject, body));

	}

	@Override
	public void queue(MailInfo mail) {
		list.add(mail);
		run();
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfo(to, subject, body));
		
	}
	
	@Scheduled(fixedDelay = 5000)
	public void run() {
		
		while(!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	

}
