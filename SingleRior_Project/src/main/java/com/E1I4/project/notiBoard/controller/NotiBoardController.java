package com.E1I4.project.notiBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotiBoardController {
	
	@RequestMapping("notiAllList.no")
	public String selectNotiAllList() {
		return "notiBoardList";
	}
	
	@RequestMapping("selectNotiBoard.no")
	public String selectNotiBoard() {
		return "notiBoardDetail";
	}
}
