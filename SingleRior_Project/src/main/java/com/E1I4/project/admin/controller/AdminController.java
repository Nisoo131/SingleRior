package com.E1I4.project.admin.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.E1I4.project.admin.model.service.AdminService;
import com.E1I4.project.common.exception.AdminException;
import com.E1I4.project.common.exception.ProductException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.member.model.vo.Member;
@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping("index.adm")
	public String adminView() {
		return"index";
	}
	@RequestMapping("insertProduct.adm")
	public String insertProduct() {
		return "insertProduct";
	}
	
	//회원정보관리
		@RequestMapping("manageUser.adm")
		public String manageUser(Model model, HttpSession session) {
			
			ArrayList<Member> selectMember=aService.selectMemberList();
			
			
			
			if(selectMember!=null) {
				model.addAttribute("mList",selectMember);
				return "manageUser";
			}else {
				throw new AdminException("유저정보 조회 실패");
			}
		}
	
	// 상품등록
	@RequestMapping("enrollProduct.adm")
	public String enrollProduct(@ModelAttribute Product p,@RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request,@RequestParam("subCategory") String subCategory) {
		
		String id=((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		p.setBoardWriter(id);
		p.setProductContent("상품등록");
		
		
		switch(subCategory) {
		case "침대" : 
			p.setProSubCateCode(101);
			break;
		case "테이블" : 
			p.setProSubCateCode(102);
			break;
		case "서랍장" : 
			p.setProSubCateCode(103);
			break;
		case "의자" : 
			p.setProSubCateCode(104);
			break;
		case "옷장" : 
			p.setProSubCateCode(105);
			break;
		case "화장대" : 
			p.setProSubCateCode(106);
			break;
		case "이불" : 
			p.setProSubCateCode(201);
			break;
		case "배게" : 
			p.setProSubCateCode(202);
			break;
		case "커튼/블라인드" : 
			p.setProSubCateCode(203);
			break;
		case "러그" : 
			p.setProSubCateCode(204);
			break;
		case "식물" : 
			p.setProSubCateCode(301);
			break;
		case "시계" : 
			p.setProSubCateCode(302);
			break;
		case "캔들/디퓨저" : 
			p.setProSubCateCode(303);
			break;
		case "윌데코/장식" : 
			p.setProSubCateCode(304);
			break;
		case "냄비/프라이팬" : 
			p.setProSubCateCode(401);
			break;
		case "그릇" : 
			p.setProSubCateCode(402);
			break;
		case "보관용기" : 
			p.setProSubCateCode(403);
			break;
		case "수저/커트러리" : 
			p.setProSubCateCode(404);
			break;
		case "컵/텀블러" : 
			p.setProSubCateCode(405);
			break;
		case "칼/도마" : 
			p.setProSubCateCode(406);
			break;
		case "냉장고" : 
			p.setProSubCateCode(501);
			break;
		case "TV/모니터" : 
			p.setProSubCateCode(502);
			break;
		case "세탁기/건조대" : 
			p.setProSubCateCode(503);
			break;
		case "컴퓨터/노트북/태블릿" : 
			p.setProSubCateCode(504);
			break;
		case "청소기" : 
			p.setProSubCateCode(505);
			break;
		case "계절가전" : 
			p.setProSubCateCode(506);
			break;
		case "이어폰/헤드셋" : 
			p.setProSubCateCode(601);
			break;
		case "스피커" : 
			p.setProSubCateCode(602);
			break;
		case "마이크" : 
			p.setProSubCateCode(603);
			break;
		case "빔프로젝터" : 
			p.setProSubCateCode(604);
			break;
		case "미용가전" : 
			p.setProSubCateCode(605);
			break;
		}
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
					a.setImgPath(returnArr[0]);
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
				a.setBoardType(1);
		}
		
		
		int result1=aService.insertProduct(p);
		int result2=aService.insertAttm(list);
		
		if(result1>0&&result2>0) {
			return "redirect:manageProduct.adm";
		}else {
			for(Attachment a:list) {
				deleteFile(a.getImgRename(),request);
			}
			throw new ProductException("상품 등록 실패");
		}
	}
		
	//파일 삭제
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			
			File folder = new File(savePath + "\\" + fileName);
			if(folder.exists()) {
				folder.delete();
			}
		}
	
	//로컬에 파일 저장 
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
