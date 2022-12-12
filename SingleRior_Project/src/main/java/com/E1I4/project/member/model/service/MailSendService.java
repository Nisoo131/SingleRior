package com.E1I4.project.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	
	public void makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(999999);
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	// 회원가입 본인 인증
	public String joinEmail(String email) {
		makeRandomNumber();
//		System.out.println("인증" + email);
		String setFrom = "singlerior8080@gmail.com"; // email-context에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"SingleRior를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	// 아이디 찾기
	public void findId(String email, String id) {

//		System.out.println("인증" + email);
		String setFrom = "singlerior8080@gmail.com"; // email-context에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "싱글리어 아이디 찾기입니다."; // 이메일 제목 
		String content = 
				"SingleRior를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "회원님의 아이디는 " + id + "입니다." + 
			    "<br>" + 
			    "해당 아이디로 로그인해주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		
	}
	
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
