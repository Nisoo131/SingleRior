package com.E1I4.project.marketBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;

public interface MarketBoardService {

	int marketBoardInsert(MarketBoard mkBoard);

	int insertAttm(HashMap<String, Object> map);

	int getMkListCount(HashMap<String, Object> map);

	ArrayList<MarketBoard> marketBoardList(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Attachment> attmListSelect();


	

}
