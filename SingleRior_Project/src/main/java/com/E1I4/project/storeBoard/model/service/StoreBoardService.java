package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface StoreBoardService {

	int getListCount(int i);

	ArrayList<StoreBoard> selectBoardList(PageInfo pi, int i);

	ArrayList<Attachment> selectAttmList(Integer imgKey);
}
