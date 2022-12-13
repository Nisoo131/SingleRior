package com.E1I4.project.commuBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.E1I4.project.commuBoard.model.service.CommuBoardService;

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
	
	@RequestMapping("insertCommuBoard.co")
	public String insertCommuBoard() {
		return "commuBoardWrite";
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
