package com.E1I4.project.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.admin.model.dao.AdminDAO;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;

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

}
