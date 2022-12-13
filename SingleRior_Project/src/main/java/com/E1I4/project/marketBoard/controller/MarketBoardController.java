package com.E1I4.project.marketBoard.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.marketBoard.model.service.MarketBoardService;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;
import com.E1I4.project.member.model.vo.Member;

@Controller
public class MarketBoardController {

	@Autowired
	private MarketBoardService mkService;
	
	//글리스트
	@RequestMapping("marketBoardList.ma")
	public String marketBoardList(@RequestParam(value="page", required=false) Integer page, Model model, @RequestParam(value="marketType", required=false) Integer mkType,
			   @RequestParam(value="search", required=false) String search, @RequestParam(value="array", required=false) Integer mkArray) {
		
		//boardType 3 market
		//marketType 같이사요 1, 팝니다2, 삽니다3
		//marketArray 조회수1, 좋아요수2, 댓글수3
		
		int marketType = 0;
		if(mkType != null ) {
			marketType = mkType;
		}
		
		int marketArray = 0;
		if(mkArray != null) {
			marketArray = mkArray;
		}
		
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("marketType", marketType);
		map.put("marketArray", marketArray);
		map.put("search", search);
		
		
		int listCount = mkService.getMkListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		ArrayList<MarketBoard> mkBList = mkService.marketBoardList(pi, map);
		ArrayList<Attachment> mkAList = mkService.attmListSelect();
		
		System.out.println(mkBList);
		System.out.println(mkAList);
		
		if(mkBList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("mkBList", mkBList);
			model.addAttribute("mkAList", mkAList);
			return "marketBoardList";
		} else {
			throw new BoardException("게시글 조회 실패");
		}
	}
	
	//글작성페이지
	@RequestMapping("marketBoardWrite.ma")
	public String marketBoardWrite() {
		return "marketBoardWrite";
	}
	
	//글insert
	@RequestMapping("marketBoardInsert.ma")
	public String marketBoardInsert(HttpServletRequest request,@ModelAttribute MarketBoard mkBoard, @RequestParam("file") ArrayList<MultipartFile> files ) {
		
		
		System.out.println(mkBoard);
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		mkBoard.setWriter(id);
		mkBoard.setMarketType(mkBoard.getMarketType());
		
		int boardResult = mkService.marketBoardInsert(mkBoard);
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg") || fileType.equals("jfif")) {
					
					String[] returnArr = saveFile(file, request);
					
					System.out.println("rename : " +fileName);
					
					if(returnArr[1] != null) {
						Attachment attm = new Attachment();
						attm.setImgOriginalName(file.getOriginalFilename());
						attm.setImgRename(returnArr[1]);
						attm.setImgPath(returnArr[0]);
						
						list.add(attm);
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			if(i == 0) {
				a.setLevel(0);
			} else {
				a.setLevel(1);
			}
				a.setBoardType(3);
		}
		
		int attmResult = 0;
		
		if(!list.isEmpty()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			attmResult = mkService.insertAttm(map);
		}
		
		if(boardResult + attmResult == list.size()+2) {
				return "redirect:marketBoardList.ma";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getImgRename(), request);
			}
			throw new BoardException("게시글 작성 실패");
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
	
	//파일저장
	private String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		System.out.println("folder : "+folder);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*10000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
											+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러" + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		System.out.println(returnArr);
		
		return returnArr;
	}
	

	
}
