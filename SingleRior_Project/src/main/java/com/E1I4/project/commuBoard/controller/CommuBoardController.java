package com.E1I4.project.commuBoard.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.commuBoard.model.service.CommuBoardService;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;
import com.E1I4.project.member.model.vo.Member;

@Controller
public class CommuBoardController {
	
	@Autowired
	private CommuBoardService cService;
	
	// 커뮤니티 전체 글 목록
	@RequestMapping("commuAllList.co")
	public String selectCommuAllList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getCommuListCount(2);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<CommuBoard> list = cService.selectCommuAllList(pi, 2);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "commuBoardList";
		} else {
			throw new BoardException("게시글 조회에 실패하였습니다.");
		}
	}
	
	// 커뮤니티 생활팁 글 목록
	@RequestMapping("commuTipList.co")
	public String selectCommuTipList() {
		return "commuTipList";
	}
	
	// 커뮤니티 후기 글 목록
	@RequestMapping("commuReviewList.co")
	public String selectCommuReviewList() {
		return "commuReviewList";
	}
	
	// 커뮤니티 자유 글 목록
	@RequestMapping("commuFreeList.co")
	public String selectCommuFreeList() {
		return "commuFreeList";
	}
	
	// 커뮤니티 글 작성 페이지
	@RequestMapping("writeCommuBoard.co")
	public String writeCommuBoard() {
		return "commuBoardWrite";
	}
	
	// 커뮤니티 글 등록 (insert)
	@RequestMapping("insertCommuBoard.co")
	public String insertCommuBoard(@ModelAttribute CommuBoard coBoard, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		coBoard.setWriter(id);
		coBoard.setCommuType(coBoard.getCommuType());
		
		int boardResult = cService.insertCommuBoard(coBoard);
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg") || fileType.equals("jfif")) {
					String[] returnArr = saveFile(file, request);
					
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
				a.setBoardType(2);
		}
		
		int attmResult = 0;
		
		if(!list.isEmpty()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			attmResult = cService.insertAttm(map);
		}
		
		if(boardResult + attmResult == list.size() + 2) {
				return "redirect:commuAllList.co";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getImgRename(), request);
			}
			throw new BoardException("글이 정상적으로 등록되지 않았습니다.");
		}
	}
	
	// 파일 저장
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}
	
	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	// 커뮤니티 글 조회
	@RequestMapping("selectCommuBoard.co")
	public ModelAndView selectCommuBoard(@RequestParam("bNo") int bNo, @RequestParam("writer") String writer, @RequestParam("page") int page, ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		if(m != null) {
			login = m.getNickName();
		}
		boolean yn = false;
		if(!writer.equals(login)) {
			yn = true;
		}
		CommuBoard coBoard = cService.selectCommuBoard(bNo, yn);
		ArrayList<Attachment> list = cService.selectAttmList((Integer)bNo);
		
		System.out.println(coBoard);
		System.out.println(page);
		System.out.println(list);
		System.out.println(writer);
		
		if(coBoard != null) {
			mv.addObject("coBoard", coBoard).addObject("page", page).addObject("list", list).setViewName("commuBoardDetail");
		} else {
			throw new BoardException("게시글 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 커뮤니티 글 수정
	@RequestMapping("updateCommuBoard.co")
	public String updateCommuBoard() {
		return "commuBoardEdit";
	}

}
