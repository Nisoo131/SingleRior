package com.E1I4.project.marketBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.E1I4.project.marketBoard.model.service.MarketBoardService;

@Controller
public class MarketBoardController {

	@Autowired
	private MarketBoardService mkService;
	
	@RequestMapping("marketBoardList.ma")
	public String marketBoardList() {
		return "marketBoardList";
	}
	
}
