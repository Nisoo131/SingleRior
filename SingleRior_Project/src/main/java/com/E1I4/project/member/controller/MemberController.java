package com.E1I4.project.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.MemberException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Board;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.member.model.service.KakaoLogin;
import com.E1I4.project.member.model.service.MailSendService;
import com.E1I4.project.member.model.service.MemberService;
import com.E1I4.project.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private MailSendService mss;
	@Autowired
	private KakaoLogin kl;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("loginView.me")
	public String loginView() {
		return "login";
	}
	
	// 로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST )
	public String login(@ModelAttribute Member m, HttpSession session, Model model) {
//		System.out.println(m);
		Member loginUser = mService.login(m);
//		System.out.println("뭔가 잘못됨:" +loginUser);
		
//		System.out.println(bcrypt.encode(m.getMemberPwd()));  // 암호화 비밀번호
		if(bcrypt.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);
//			 System.out.println("로그인성공");
			 return "redirect:/";
		} else {
			throw new MemberException("로그인에 실패하였습니다.");
		}
	}
	
	//카카오 로그인
	@RequestMapping(value="kakaoLogin.me", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,@ModelAttribute Member m, HttpSession session) {
//		System.out.println(code);
//		System.out.println(code);
		
		String access_Token = kl.getAccessToken(code);
//		System.out.println(access_Token);
		
		HashMap<String, Object> userInfo = kl.getUserInfo(access_Token);
//		System.out.println("access_Token : " + access_Token);
//		System.out.println("nickname : " + userInfo.get("nickname"));
//		System.out.println("email : " + userInfo.get("email"));
//		System.out.println("id : " + userInfo.get("kakaoId"));
		
		String memberId = (String) userInfo.get("kakaoId");
		String email = (String) userInfo.get("email");
		String memberName = (String)userInfo.get("nickname");
		
		int count = mService.checkId("kakao*"+memberId);
//		System.out.println("회원가입이 되어있는가..:"+ count);
		
		// count 1이면 로그인
		Member loginUser = null;
		if(count == 1) {
			m.setMemberId("kakao*"+memberId);
			loginUser = mService.login(m);
		
		}else if(count == 0) {
			m.setMemberId("kakao*"+memberId);
			String encPwd = bcrypt.encode(memberId);
			m.setMemberPwd(encPwd);
			m.setMemberName(memberName);
			m.setEmail(email);
			m.setNickName(memberName);
//			System.out.println(m);
			int result = mService.insertMember(m);
			
			if(result > 0) {
				m.setMemberId("kakao*"+memberId);
				loginUser = mService.login(m);
				session.setAttribute("loginUser", loginUser);
				return "redirect:/";
			}
		}
		session.setAttribute("loginUser", loginUser);
		return "redirect:/";
		
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
	public String myPage(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		// 프로필 사진 가져오기
		
		Attachment a = mService.selectProfile(m.getMemberId());
//		System.out.println(a);
			model.addAttribute("a", a);
			return "myPage";
	}
	
	@RequestMapping("checkPwd.me")
	@ResponseBody
	public String checkPwd(@RequestParam("memberPwd") String memberPwd, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
//		System.out.println(m);
		
		if(bcrypt.matches(memberPwd, m.getMemberPwd())) {
			return "true";
		} else {
			return "false";
		}
	}
	
	
	@RequestMapping("editMyInfo.me")
	public String editMyInfo(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		// 프로필 사진 가져오기
		
		Attachment a = mService.selectProfile(m.getMemberId());
//		System.out.println(a);
		
		model.addAttribute("a", a);
		return "editMyInfo";
	}
	
	// 회원 정보 수정
	@RequestMapping("updateMember.me")
	public String updateMember(HttpServletRequest reqeust, @ModelAttribute Member m, @RequestParam(value="newPwd", required=false) String newPwd,
								HttpSession session, Model model , @RequestParam(value="file", required=false) MultipartFile file, HttpServletRequest request) {
		
		
		int count = mService.getProfilePhotoCount(m.getMemberId());
		
		Attachment a = null;
		boolean check = false;
			MultipartFile upload = file;
//			System.out.println("null인가..:" + upload);
			
			if(!upload.getOriginalFilename().equals("")) {
				
				String[] returnArr = saveFile(upload, request);
//				System.out.println(returnArr);
					
				if(returnArr[1] != null) {
					a = new Attachment();
					a.setImgOriginalName(upload.getOriginalFilename());
					a.setImgRename(returnArr[1]);
					a.setImgPath(returnArr[0]);
					a.setImgKey(m.getMemberId());
					a.setBoardType(4);  // 프로필은 4로
				}
				if(count != 1) {
					int result = mService.insertProfile(a);
				}else {
					int result = mService.updateProfile(a);
				}
			}
//			System.out.println("들어왔나 : " + a);

		//회원 정보 수정
		if(!newPwd.trim().equals("")) {
			String encPwd = bcrypt.encode(newPwd);
			m.setMemberPwd(encPwd);
//			System.out.println("새비번있음: ");
		}else {
			m.setMemberPwd(null);
//			System.out.println("새비번ㄴㄴ음: " + m);
		}
		

		int result = mService.updateMember(m);
		
		if(result > 0) {
//			System.out.println("최종 : " +a);
			model.addAttribute("profile", a);
			session.setAttribute("loginUser", mService.login(m));
			return "redirect:myPage.me";
		}else {
			throw new MemberException("비밀번호 발급 실패");
		}
	}
	
	private String[] saveFile(MultipartFile upload, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*10000);
		String originFileName = upload.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
									+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			upload.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}

	// 프로필 사진 기본 사진으로 변경
	@RequestMapping("deleteProfile.me")
	@ResponseBody
	public String deleteProfile(@RequestParam("memberId") String memberId) {
//		System.out.println(memberId);
		
		int result = mService.deleteProfile(memberId);
//		System.out.println(result);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 회원탈퇴
	@RequestMapping("deleteMember.me")
	public String deleteMember(@RequestParam("memberId") String memberId) {
		if(!memberId.contains("kakao*")) {
			int result = mService.deleteMember(memberId);
			if(result>0) {
				return "redirect:logout.me";
			} else {
				throw new MemberException("회원탈퇴를 실패하였습니다.");
			}
		}else{
			int result = mService.deleteKakaoMember(memberId);
			if(result>0) {
				return "redirect:logout.me";
			} else {
				throw new MemberException("회원탈퇴를 실패하였습니다.");
			}
		}
	}
	
	@RequestMapping("myCart.me")
	public String myCart() {
		return "myCart";
	}
	@RequestMapping("serviceCenter.me")
	public String serviceCenter() {
		return "serviceCenter";
	}
	@RequestMapping("wishList.me")
	public String wishList() {
		return "wishList";
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
	public String myContentList(@RequestParam(value="page", required=false) Integer page, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String memberId = m.getMemberId();
		
		int currentPage =1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
//		map.put("category", category);
		int listCount = mService.getMyContentListCount(map);
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Board> bList = mService.selectBoardList(pi, map);
		
		for(int i=0; i< bList.size(); i++) {
			int boardNo = bList.get(i).getBoardNo();
			int likeCount = mService.getLikeCount(boardNo);
			int replyCount = mService.getReplyCount(boardNo);
			bList.get(i).setLikeCount(likeCount);
			bList.get(i).setReplyCount(replyCount);
		}
		
		
		if(bList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("bList", bList);
//			model.addAttribute("category",category);
		}
		return "myContentList";
	}
	
	@RequestMapping("selectCategory.me")
	public String selectCategory(@RequestParam(value="page", required=false) Integer page, @RequestParam("category") String category,HttpSession session,
									Model model) {
		System.out.println(category);
		Member m = (Member)session.getAttribute("loginUser");
		String memberId = m.getMemberId();
		
		int currentPage =1;
		if(page != null) {
			currentPage = page;
		}
		System.out.println(currentPage);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("category", category);
		int listCount = mService.getMyContentListCount(map);
//		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Board> bList = mService.selectBoardList(pi, map);
		
		for(int i=0; i< bList.size(); i++) {
			int boardNo = bList.get(i).getBoardNo();
			int likeCount = mService.getLikeCount(boardNo);
			int replyCount = mService.getReplyCount(boardNo);
			bList.get(i).setLikeCount(likeCount);
			bList.get(i).setReplyCount(replyCount);
		}
		
		if(bList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("bList", bList);
			model.addAttribute("category",category);
		}
		return "myContentList";
	}
	
	@RequestMapping("myReplyList.me")
	public String myReplyList() {
		return "myReplyList";
	}
}
