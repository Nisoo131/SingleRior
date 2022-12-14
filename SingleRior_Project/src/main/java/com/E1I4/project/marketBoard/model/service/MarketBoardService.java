package com.E1I4.project.marketBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;

public interface MarketBoardService {

	int marketBoardInsert(MarketBoard mkBoard);

	int insertAttm(HashMap<String, Object> map);

	int getMkListCount(HashMap<String, Object> map);

	ArrayList<MarketBoard> marketBoardList(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Attachment> attmListSelect();

	WishList wishListSelect(WishList wl);

	MarketBoard marketBoardSelect(int bNo, boolean yn);

	ArrayList<Attachment> selectAttm(int bNo);

	ArrayList<Reply> replySelect(int bNo);

	ArrayList<ReReply> reReplySelect(int bNo);

	ArrayList<MarketBoard> marketTopList(HashMap<String, Object> map);

	ArrayList<Attachment> topAttmListSelect();




	

}
