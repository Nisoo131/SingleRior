package com.E1I4.project.commuBoard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.commuBoard.model.service.CommuBoardService;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;
import com.E1I4.project.member.model.vo.Member;

@Controller
public class CommuBoardController {
	
	@Autowired
	private CommuBoardService cService;
	
	@RequestMapping("commuAllList.co")
	public String selectCommuAllList() {
		return "commuBoardList";
	}
	
	@RequestMapping("commuTipList.co")
	public String selectCommuTipList() {
		return "commuTipList";
	}
	
	@RequestMapping("commuReviewList.co")
	public String selectCommuReviewList() {
		return "commuReviewList";
	}
	
	@RequestMapping("commuAskList.co")
	public String selectCommuAskList() {
		return "commuAskList";
	}
	
	@RequestMapping("commuFreeList.co")
	public String selectCommuFreeList() {
		return "commuFreeList";
	}
	
	@RequestMapping("writeCommuBoard.co")
	public String writeCommuBoard() {
		return "commuBoardWrite";
	}
	
	@RequestMapping("insertCommuBoard.co")
	public String insertCommuBoard(@ModelAttribute CommuBoard b, HttpSession session) {
		String writer = ((Member)session.getAttribute("loginUser")).getNickName();
		b.setWriter(writer);
		b.setBoardType(2);
		
		int result = cService.insertCommuBoard(b);
		
		if(result > 0) {
			return "redirect:commuAllList.co";
		} else {
			throw new BoardException("글이 정상적으로 등록되지 않았습니다.");
		}
	}
	
	@RequestMapping("selectCommuBoard.co")
	public String selectCommuBoard() {
		return "commuBoardDetail";
	}
	
	@RequestMapping("updateCommuBoard.co")
	public String updateCommuBoard() {
		return "commuBoardEdit";
	}

}
