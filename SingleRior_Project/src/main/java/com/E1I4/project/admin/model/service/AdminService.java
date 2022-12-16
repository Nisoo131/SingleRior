package com.E1I4.project.admin.model.service;

import java.util.ArrayList;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface AdminService {

	int insertProduct(Product p);

	int insertAttm(ArrayList<Attachment> list);

	ArrayList<Member> selectMemberList();

	Member selectMember(String memberId);

	int editMember(Member m);

	ArrayList<ProductList> selectProductList(int i);

	ArrayList<Attachment> selectAttmList();

}
