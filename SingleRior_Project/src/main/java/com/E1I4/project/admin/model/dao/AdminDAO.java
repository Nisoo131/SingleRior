package com.E1I4.project.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Board;
import com.E1I4.project.common.model.vo.Notice;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductList;
import com.E1I4.project.common.model.vo.Qna;
import com.E1I4.project.common.model.vo.Report;
import com.E1I4.project.member.model.vo.Member;
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

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession,int i) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAttmList",i);
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

	public void updateAttmLevel(SqlSessionTemplate sqlSession, String bId) {
		sqlSession.update("adminMapper.updateAttmLevel",bId);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		int updateProduct= sqlSession.update("adminMapper.updateProduct",p);
		int updateBoard=sqlSession.update("adminMapper.updateBoard",p);
		int result=updateProduct+updateBoard;
		return result;
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.update("adminMapper.deleteProduct",productNo);
	}


	public int successProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("adminMapper.successProduct",productNo);
	}
	
	
	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.listCount",i);
	}

	public int enrollNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.enrollNotice",n);
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		ArrayList<Notice> list=(ArrayList)sqlSession.selectList("adminMapper.selectNoticeList",i,rowBounds);
		
	return list;
	}

	public int addCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("adminMapper.addCount",bNo);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("adminMapper.selectNotice",bNo);
	}

	public int editNotice(SqlSessionTemplate sqlSession, Notice n) {
		int boardEdit = sqlSession.update("adminMapper.editBoardNotice",n);
		int noticeEdit= sqlSession.update("adminMapper.editNotice",n);
		
		int result=boardEdit+noticeEdit;
		return result;
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("adminMapper.deleteNotice",bNo);
	}

	public int enrollQNA(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("adminMapper.enrollQNA",q);
	}

	public ArrayList<Qna> selectQNAList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		ArrayList<Qna> list=(ArrayList)sqlSession.selectList("adminMapper.selectQNAList",i,rowBounds);
		
		return list;
	}

	public Qna selectQNADetail(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("adminMapper.selectQNA",bNo);
	}

	public int editQNA(SqlSessionTemplate sqlSession, Qna q) {
		int boardEdit=sqlSession.update("adminMapper.boardQNAEdit",q);
		int QNAEdit=sqlSession.update("adminMapper.QNAEdit",q);
		
		int result=boardEdit+QNAEdit;
		return result;
	}

	public int deleteQNA(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("adminMapper.deleteQNA",bNo);
	}

	public int insertBannerBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertBannerBoard",b);
	}

	public ArrayList<Board> selectBannerBoard(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBannerBoard",i);
	}

	public ArrayList<Attachment> selectBannerAttm(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBannerAttm",i);
	}

	public Board selectBannerDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.selectBannerDetail",boardNo);
	}

	public ArrayList<Attachment> selectBannerAttmList(SqlSessionTemplate sqlSession,String bId) {
		return(ArrayList)sqlSession.selectList("adminMapper.selectBannerAttmList",bId);
	}

	public int deleteBannerBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteBannerBoard",boardNo);
	}

	public int deleteBannerAttm(SqlSessionTemplate sqlSession, String imgKey) {
		return sqlSession.update("adminMapper.deleteBannerAttm",imgKey);
	}

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectRortList");
	}


}
