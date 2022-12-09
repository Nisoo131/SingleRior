package com.E1I4.project.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.E1I4.project.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	@RequestMapping("enrollView.me")
	public String enrollView(){
		return "enrollView";
	}
	@RequestMapping("findIdView.me")
	public String findIdView() {
		return "findIdView";
	}
	@RequestMapping("findPwdView.me")
	public String findPwdView() {
		return "findPwdView";
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
