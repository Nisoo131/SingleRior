package com.E1I4.project.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
@Repository("aDAO")
public class AdminDAO {

	public int insertPrduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("adminMapper.insertProduct",p);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		return sqlSession.insert("adminMapper.insert",list);
	}

}
