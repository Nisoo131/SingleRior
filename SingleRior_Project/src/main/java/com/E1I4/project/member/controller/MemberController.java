package com.E1I4.project.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.E1I4.project.common.exception.MemberException;
import com.E1I4.project.member.model.service.MailSendService;
import com.E1I4.project.member.model.service.MemberService;
import com.E1I4.project.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private MailSendService mss;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	// 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String login(@ModelAttribute Member m, HttpSession session, Model model) {
		System.out.println(m);
		
		Member loginUser = mService.login(m);
		System.out.println("뭔가 잘못됨:" +loginUser);
		
		System.out.println(bcrypt.encode(m.getMemberPwd()));  // 암호화 비밀번호
		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);
			 System.out.println("로그인성공");
			 return "redirect:/";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	// 회원가입 아이디 중복체크
	@RequestMapping("checkId.me")
	@ResponseBody
	public int checkId(@RequestParam("memberId") String memberId) {
		int count = mService.checkId(memberId);
		return count;
	}
	// 회원가입 닉네임 중복체크
	@RequestMapping("checkNickName.me")
	@ResponseBody
	public int checkNickName(@RequestParam("nickName") String nickName) {
		
		int count = mService.checkNickName(nickName);
//		System.out.println(count);
		
		return count;
	}
	
	// 회원가입 이메일 중복확인
	@RequestMapping(value="checkEmailConfirm.me", method=RequestMethod.POST)
	@ResponseBody
	public int checkEmailConfirm(@RequestParam("email") String email) {
		
		int count = mService.checkEmailConfirm(email);
		return count;
	}
	
	
	// 회원가입 이메일 인증
	@RequestMapping("checkMail.me")
	@ResponseBody
	public String checkMail(@RequestParam("email") String email) {
		
//		System.out.println(email);
		return mss.joinEmail(email);
	}
	
	// 회원가입 
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m) {
		System.out.println(m);
		
		String encPwd = bcrypt.encode(m.getMemberPwd());
		m.setMemberPwd(encPwd);
		
		int result = mService.insertMember(m);
		if(result > 0) {
			return "redirect:home.do";
		}else {
			throw new MemberException("회원가입 실패");
		}
	}
	
	@RequestMapping("enrollView.me")
	public String enrollView(){
		return "enrollView";
	}
	
	@RequestMapping("findIdView.me")
	public String findIdView() {
		return "findIdView";
	}
	
	// 아이디 찾기
	@RequestMapping("findId.me")
	@ResponseBody
	public String findLoginId(@ModelAttribute Member m) {
		
		String id = mService.findId(m);
		if(id != null) {
			mss.findId(m.getEmail(), id);
	//		System.out.println(id);
		}else {
			throw new MemberException("아이디 찾기 실패");
		}
		return "성공";
		
		
	}
	@RequestMapping("findPwdView.me")
	public String findPwdView() {
		return "findPwdView";
	}
	
	// 비밀번호 찾기
	@RequestMapping("findPwd.me")
	@ResponseBody
	public int findPwd(@ModelAttribute Member m) {
		// 일치하는 회원 정보 
		int result = mService.findPwd(m);
		int changePwd = 0;
		//회원 정보가 있다면 메일에 임시 비밀번호 발급
		if(result >= 1) {
			String newPwd = mss.findPwd(m.getEmail());
			String encPwd = bcrypt.encode(newPwd);
			m.setMemberPwd(encPwd);
			
			changePwd = mService.changePwd(m);
		}
		
		if(changePwd >= 1) {
			return changePwd;
		}else {
			throw new MemberException("비밀번호 발급 실패");
		}
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "myPage";
	}
	@RequestMapping("editMyInfo.me")
	public String editMyInfo() {
		return "editMyInfo";
	}
	@RequestMapping("myCart.me")
	public String myCart() {
		return "myCart";
	}
	@RequestMapping("serviceCenter.me")
	public String serviceCenter() {
		return "serviceCenter";
	}
	
	@RequestMapping("orderList.me")
	public String searchOrder() {
		return "orderList";
	}
	@RequestMapping("orderProductDetail.me")
	public String orderProductDetail() {
		return "orderProductDetail";
	}
	@RequestMapping("orderCancelList.me")
	public String orderCancelList() {
		return "orderCancelList";
	}
	@RequestMapping("myReviewDoneList.me")
	public String myReviewList() {
		return "myReviewDoneList";
	}
	@RequestMapping("myReviewNDoneList.me")
	public String myReviewNDoneList() {
		return "myReviewNDoneList";
	}
	@RequestMapping("myAskList.me")
	public String myAskList() {
		return "myAskList";
	}
	@RequestMapping("myAskDoneList.me")
	public String myAskDoneList() {
		return "myAskDoneList";
	}
	@RequestMapping("myContentList.me")
	public String myContentList() {
		return "myContentList";
	}
	@RequestMapping("myReplyList.me")
	public String myReplyList() {
		return "myReplyList";
	}
}
