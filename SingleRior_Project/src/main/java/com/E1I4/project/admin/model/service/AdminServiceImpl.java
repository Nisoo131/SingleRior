package com.E1I4.project.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.admin.model.dao.AdminDAO;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertProduct(Product p) {
		return aDAO.insertPrduct(sqlSession,p);
	}

	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return aDAO.insertAttm(sqlSession,list);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		return aDAO.selectMemberList(sqlSession);
	}

	@Override
	public Member selectMember(String memberId) {
		return aDAO.selectMemberList(sqlSession,memberId);
	}

	@Override
	public int editMember(Member m) {
		return aDAO.editMember(sqlSession,m);
	}

	@Override
	public ArrayList<ProductList> selectProductList(int i) {
		return aDAO.selectProductList(sqlSession,i);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return aDAO.selectAttmList(sqlSession);
	}

	@Override
	public ProductList selectProductDetail(int productNo) {
		return aDAO.selectProductDetail(sqlSession,productNo);
	}

	@Override
	public ArrayList<Attachment> selectAttmListDetail(int bId) {
		return aDAO.selectAttmListDetail(sqlSession,bId);
	}

	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return aDAO.deleteAttm(sqlSession,delRename);
	}

	@Override
	public void updateAttmLevel(String bId) {
		aDAO.updateAttmLevel(sqlSession,bId);
	}

	@Override
	public int updateProduct(Product p) {
		return aDAO.updateProduct(sqlSession,p);
	}

	@Override
	public int deleteProduct(int productNo) {
		return aDAO.deleteProduct(sqlSession,productNo);
	}

}
