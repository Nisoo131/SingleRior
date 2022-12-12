package com.E1I4.project.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.member.model.vo.Member;
@Controller
public class AdminController {
	
	@RequestMapping("index.adm")
	public String adminView() {
		return"index";
	}
	@RequestMapping("insertProduct.adm")
	public String insertProduct() {
		return "insertProduct";
	}
	@RequestMapping("enrollProduct.adm")
	public String enrollProduct(@ModelAttribute Product p,@RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request ) {
		
		String id=((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		p.setBoardWriter(id);
		p.setProductContent("상품등록");
		
		System.out.println(p);
		System.out.println(files);
		
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		//ArrayList안에 파일들을 넣는다.!! 
		
		for(int i=0;i<files.size();i++) {
			MultipartFile upload=files.get(i);
			
			if(!upload.getOriginalFilename().equals("")) {
			
				String[] returnArr =saveFile(upload,request);
				
				if(returnArr[1]!=null) {
					Attachment a = new Attachment();
					
					a.setImgOriginalName(upload.getOriginalFilename());
					a.setImgRename(returnArr[1]);
					a.setImgPath(id);
					list.add(a);
				}
			}
		}
		
		for(int i=0;i<list.size();i++) {
			Attachment a =list.get(i);
			if(i==0) {
				a.setLevel(0);
			}else {
				a.setLevel(1);
			}
		}
		
		
		return null;
	}
		
	
	
	
	public String[] saveFile(MultipartFile file,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		//윈도우 경로
		String savePath=root+"\\uploadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
			//폴더가 없으면 폴더를 만들어줘!!
		}
		//날짜를 이용하여 파일이름 리네임할거임 !!
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		int ranNum=(int)(Math.random()*100000);
		String originFileName=file.getOriginalFilename();
		String renameFileName=sdf.format(new Date(System.currentTimeMillis()))+ranNum+originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 짓는다             ㄴ데이터 업로드된 날짜 및 시간          ㄴ랜덤값           뒤에 추출
		
		
		// 변경된 이름을 파일안에 저장한다.
		String renamePath=folder+"\\"+renameFileName;
		
		
			try {
				file.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러"+e.getMessage());
			}
		
			String[] returnArr=new String [2];
			returnArr[0]=savePath;
			returnArr[1]=renameFileName;
		
		return returnArr;
	}
	
	
	
	@RequestMapping("orderList.adm")
	public String orderList() {
		return "orderList";
	}
	@RequestMapping("manageUser.adm")
	public String manageUser() {
		return "manageUser";
	}
	@RequestMapping("manageProduct.adm")
	public String manageProduct() {
		return "manageProduct";
	}
	@RequestMapping("statUser.adm")
	public String statUser() {
		return "statUser";
	}
	@RequestMapping("statProduct.adm")
	public String statProduct() {
		return "statProduct";
	}
	@RequestMapping("manageNotice.adm")
	public String managerNotice() {
		return "manageNotice";
	}
	@RequestMapping("manageQNA.adm")
	public String managerQNA() {
		return "manageQNA";
	}
	@RequestMapping("insertNotice.adm")
	public String insertNotice() {
		return "insertNotice";
	}
	@RequestMapping("insertQNA.adm")
	public String insertQNA() {
		return "insertQNA";
	}
	@RequestMapping("manageReport.adm")
	public String manageReport() {
		return "manageReport";
	}
	@RequestMapping("manageBanner.adm")
	public String managerBanner() {
		return "manageBanner";
	}
	@RequestMapping("insertBanner.adm")
	public String insertBanner() {
		return "insertBanner";
	}
	@RequestMapping("updateBanner.adm")
	public String updateBanner() {
		return "updateBanner";
	}
	@RequestMapping("managePoint.adm")
	public String managePoint() {
		return "managePoint";
	}
	@RequestMapping("updatePoint.adm")
	public String updatePoint() {
		return "updatePoint";
	}
}
