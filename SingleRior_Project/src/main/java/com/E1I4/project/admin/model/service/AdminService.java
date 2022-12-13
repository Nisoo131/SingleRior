package com.E1I4.project.admin.model.service;

import java.util.ArrayList;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.member.model.vo.Member;

public interface AdminService {

	int insertProduct(Product p);

	int insertAttm(ArrayList<Attachment> list);

	ArrayList<Member> selectMemberList();

}
