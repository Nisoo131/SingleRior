package com.E1I4.project.commuBoard.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.commuBoard.model.service.CommuBoardService;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;
import com.E1I4.project.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class CommuBoardController {
	
	@Autowired
	private CommuBoardService cService;
	
	// 커뮤니티 전체 글 목록
	@RequestMapping("commuAllList.co")
	public String selectCommuAllList(@RequestParam(value="page", required=false) Integer page, Model model,
			@RequestParam(value="commuArray", required=false) Integer coArray, @RequestParam(value="commuType", required=false) Integer coType) {
		// 싱글벙글 카테고리 -> 1: 생활팁, 2: 후기, 3: 자유
		int commuType = 0;
		if(coType != null) {
			commuType = coType;
		}
		
		// 정렬 -> 1: 최신순, 2: 공감순, 3: 댓글순
		int commuArray = 0;
		if(coArray != null) {
			commuArray = coArray;
		}
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("commuType", commuType);
		map.put("commuArray", commuArray);
		
		int listCount = cService.getCommuListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<CommuBoard> list = cService.selectCommuAllList(pi, map);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "commuBoardList";
		} else {
			throw new BoardException("게시글 목록 조회에 실패하였습니다.");
		}
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
		ArrayList<Attachment> list = cService.selectAttmBoard((Integer)bNo);
		
		ArrayList<Reply> coRList = cService.selectReply(bNo);
		ArrayList<ReReply> coRRList = cService.selectReReply(bNo);
		
		System.out.println(coBoard);
		System.out.println(list);
		System.out.println(coRList);
		System.out.println(coRRList);
		System.out.println(page);
		System.out.println(writer);
		
		if(coBoard != null) {
			mv.addObject("coBoard", coBoard);
			mv.addObject("coRList", coRList);
			mv.addObject("coRRList", coRRList);
			mv.addObject("page", page);
			mv.addObject("list", list);
			mv.setViewName("commuBoardDetail");
		} else {
			throw new BoardException("게시글 상세보기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 커뮤니티 댓글 등록 (insert)
	@RequestMapping(value="insertReply.co")
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		int result = cService.insertReply(r);
		ArrayList<Reply> list = cService.selectReply(r.getBoardNo());
		
		System.out.println(r);
		System.out.println(list);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	// 커뮤니티 글 수정
	@RequestMapping("updateCommuBoard.co")
	public String updateCommuBoard() {
		return "commuBoardEdit";
	}

}
