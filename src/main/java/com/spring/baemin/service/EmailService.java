package com.spring.baemin.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	public void emailInsert() throws MessagingException, UnsupportedEncodingException {
		String FROM = "jongbam12358@gmail.com";
		String FROMNAME = "Team iT-imagination";
		String TO = "whdxoddl999@naver.com";
		String SMTP_USERNAME = "jongbam12358@gmail.com";
		String SMTP_PASSWORD = "hfmaanooruuwwdfq";

		String HOST = "smtp.gmail.com";
		int PORT = 587;

		String SUBJECT = "헬로";

		String BODY = String.join(System.getProperty("line.separator"), 
				"<h1>인증 번호</h1>",
				"<p>54684</p>."
				);
		
		Properties props = System.getProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(FROM, FROMNAME));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
		msg.setSubject(SUBJECT);
		msg.setContent(BODY, "text/html;charset=euc-kr");

		Transport transport = session.getTransport();
		try {
			System.out.println("Sending...");

			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("Email sent!");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			transport.close();
		}
	}
}
