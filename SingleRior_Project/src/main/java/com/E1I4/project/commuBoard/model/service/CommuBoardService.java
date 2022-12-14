package com.E1I4.project.commuBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;

public interface CommuBoardService {
	
	int getCommuListCount(int i);
	
	ArrayList<CommuBoard> selectCommuAllList(PageInfo pi, int i);

	int insertCommuBoard(CommuBoard coBoard);

	int insertAttm(HashMap<String, Object> map);

	CommuBoard selectCommuBoard(int bNo, boolean yn);

	ArrayList<Attachment> selectAttmList(Integer bNo);

}
