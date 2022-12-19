package com.E1I4.project.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;
@Repository("aDAO")
public class AdminDAO {

	public int insertPrduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("adminMapper.insertProduct",p);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		return sqlSession.insert("adminMapper.insertProductAttm",list);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList");
	}

	public Member selectMemberList(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("adminMapper.selectMember",memberId);
	}

	public int editMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.editMember", m);
	}

	public ArrayList<ProductList> selectProductList(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectProductList",i);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAttmList");
	}

	public ProductList selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("adminMapper.selectProductDetail",productNo);
	}

	public ArrayList<Attachment> selectAttmListDetail(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAttmListDetail",bId);
	}

	public int deleteAttm(SqlSessionTemplate sqlSession, ArrayList<String> delRename) {
		return sqlSession.delete("adminMapper.deleteAttm",delRename);
	}

	public void updateAttmLevel(SqlSessionTemplate sqlSession, int boardNo) {
		sqlSession.update("adminMapper.updateAttmLevel",boardNo);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		int updateProduct= sqlSession.update("adminMapper.updateProduct",p);
		int updateBoard=sqlSession.update("adminMapper.updateBoard",p);
		
		int result=updateProduct+updateBoard;
		
		return result;
	}

}
