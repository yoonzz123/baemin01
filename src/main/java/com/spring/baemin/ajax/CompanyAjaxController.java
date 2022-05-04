package com.spring.baemin.ajax;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.service.EmailService;

@Controller
public class CompanyAjaxController {
	
	@Autowired
	private EmailService emailService;
	
	
	
	@RequestMapping("emailCheck.ajax")
	@ResponseBody
	public void emailCheck() throws UnsupportedEncodingException, MessagingException {
		emailService.emailInsert();
	}
}
