package com.care.homin.membership.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
	public static JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();
		jms.setHost("smtp.gmail.com");
		jms.setPort(587);
		jms.setUsername("hawonyu400@gmail.com"); //송신 계정 이메일
		jms.setPassword("dkgkd1594826"); //송신 계정 비밀번호
		
		Properties prop = new Properties();
		prop.setProperty("mail.teansport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		jms.setJavaMailProperties(prop);
		
		return jms;
	}
}
