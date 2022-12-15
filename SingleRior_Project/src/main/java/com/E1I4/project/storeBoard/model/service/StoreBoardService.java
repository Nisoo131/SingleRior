package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface StoreBoardService {

	int getStoreListCount(int i);

	ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, int i);

	ArrayList<Attachment> selectAttmList();

}
