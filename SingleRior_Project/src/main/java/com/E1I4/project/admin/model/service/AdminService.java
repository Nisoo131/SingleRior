package com.E1I4.project.admin.model.service;

import java.util.ArrayList;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Notice;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductList;
import com.E1I4.project.common.model.vo.Qna;
import com.E1I4.project.member.model.vo.Member;

public interface AdminService {

	int insertProduct(Product p);

	int insertAttm(ArrayList<Attachment> list);

	ArrayList<Member> selectMemberList();

	Member selectMember(String memberId);

	int editMember(Member m);

	ArrayList<ProductList> selectProductList(int i);

	ArrayList<Attachment> selectAttmList();

	ProductList selectProductDetail(int productNo);

	ArrayList<Attachment> selectAttmListDetail(int bId);

	int deleteAttm(ArrayList<String> delRename);

	void updateAttmLevel(String bId );

	int updateProduct(Product p);

	int deleteProduct(int productNo);

	int getListCount(int i);

	int enrollNotice(Notice n);

	ArrayList<Notice> selectNoticeList(PageInfo pi, int i);

	Notice detailNotice(int bNo, boolean yn);

	int editeNotice(Notice n);

	int deleteNotice(int bNo);

	int enrollQNA(Qna q);

	ArrayList<Qna> selectQNAList(PageInfo pi, int i);





}
