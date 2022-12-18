package com.E1I4.project.commuBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;

public interface CommuBoardService {
	
	int getCommuListCount(HashMap<String, Object> map);
	
	ArrayList<CommuBoard> selectCommuAllList(PageInfo pi, HashMap<String, Object> map);
	
	int insertCommuBoard(CommuBoard coBoard);

	int insertAttm(HashMap<String, Object> map);

	CommuBoard selectCommuBoard(int bNo, boolean yn);

	ArrayList<Attachment> selectAttmBoard(String bNo);

	ArrayList<Reply> selectReply(int bNo);

	ArrayList<ReReply> selectReReply(int bNo);

	int insertReply(Reply r);

	int symptOn(WishList wl, int bNo);

	WishList selectSymptOn(WishList wl);

	int symptOff(WishList wl, int bNo);

	ArrayList<CommuBoard> replyCount(HashMap<String, Object> map);

	int deleteAttm(ArrayList<String> delRename);

	int updateCommuBoard(CommuBoard coBoard);

	void updateAttmLevel(int boardNo);

}
