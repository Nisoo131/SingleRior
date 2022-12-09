package com.E1I4.project.marketBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.marketBoard.model.dao.MarketBoardDAO;



@Service("mkService")
public class MarketBoardServiceImpl implements MarketBoardService{
	
	@Autowired
	private MarketBoardDAO mkDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
