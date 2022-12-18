package com.E1I4.project.marketBoard.controller;

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

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.marketBoard.model.service.MarketBoardService;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;
import com.E1I4.project.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class MarketBoardController {

	Gson gson = new Gson();
	
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
		
		ArrayList<MarketBoard> topBList = mkService.marketTopList(marketType);
		ArrayList<Attachment> topAList = mkService.topAttmListSelect(marketType);
		
		
		
		
		
		if(mkBList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("mkBList", mkBList);
			model.addAttribute("mkAList", mkAList);
			model.addAttribute("topBList", topBList);
			model.addAttribute("topAList", topAList);
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

		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		mkBoard.setWriter(id);
		mkBoard.setMarketType(mkBoard.getMarketType());
		
		int boardResult = mkService.marketBoardInsert(mkBoard);
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				
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
		
		return returnArr;
	}
	
	//상세페이지
		@RequestMapping("marketBoardDetail.ma")
		public String marketBoardDetail(@RequestParam("bNo") int bNo, @RequestParam(value="boardWriter", required=false) String boardWriter, HttpSession session, Model model) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			boolean yn = true;
			String strBNo = Integer.toString(bNo);
			if(loginUser != null && boardWriter != null) {
				String id = loginUser.getMemberId();
				if(id.equals(boardWriter)) {
					yn = false;
				}
			}
			
			WishList wl = new WishList();
			WishList wishList = null;
			
			if(loginUser != null) {
				wl.setBoardNo(bNo);
				wl.setMemberId (loginUser.getMemberId());
				wishList = mkService.wishListSelect(wl);
			}
			
			
			MarketBoard mkBoard = mkService.marketBoardSelect(bNo, yn);
			ArrayList<Attachment> mkAList = mkService.selectAttm(strBNo);
			ArrayList<Reply> mkRList = mkService.replySelect(bNo);
			ArrayList<ReReply> mkRRList = mkService.reReplySelect(bNo);
			
			
			
			
			if(mkBoard != null) {
				model.addAttribute("mkBoard", mkBoard);
				model.addAttribute("mkAList", mkAList);
				model.addAttribute("wishList", wishList);
				model.addAttribute("mkRList", mkRList);
				model.addAttribute("mkRRList", mkRRList);
				
				return "marketBoardDetail";
			
			} else {
				throw new BoardException("게시글 조회 실패.");
			}
		}


		//댓글 insert
		@RequestMapping("replyInsert.ma")
		public void replyInsert(@ModelAttribute Reply reply, HttpServletResponse response ) {
			int result = mkService.replyInsert(reply);
			ArrayList<Reply> rList = mkService.replySelect(reply.getBoardNo());

			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder();
			GsonBuilder gb2 =  gb.setDateFormat("yyyy-MM-dd");
			Gson gson = gb2.create();
			
			try {
				gson.toJson(rList, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}

		
		}
		
		// 댓글 삭제
		@RequestMapping("replyDelete.ma")
		public String replyDelete(@RequestParam("rNo") int rNo, @RequestParam("bNo") String bNo, Model model) {
			int result = mkService.replyDelete(rNo);
			
			if(result > 0) {
				model.addAttribute("bNo", bNo);
				return "redirect:marketBoardDetail.ma";
			} else {
				throw new BoardException("댓글 삭제 실패");
			}

		}
		//댓글 수정
		@RequestMapping("replyUpdate.ma")
		public void replyUpdate(@ModelAttribute Reply reply, HttpServletResponse response ) {
			int result = mkService.replyUpdate(reply);
			ArrayList<Reply> rList = mkService.replySelect(reply.getBoardNo());
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder();
			GsonBuilder gb2 =  gb.setDateFormat("yyyy-MM-dd");
			Gson gson = gb2.create();

			try {
				gson.toJson(rList, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}

		
		}
		
		
		
		
		//대댓글 insert
		@RequestMapping("reReplyInsert.ma")
		public void reReplyInsert(@ModelAttribute ReReply reReply, HttpServletResponse response ) {
			int result = mkService.reReplyInsert(reReply);
			ArrayList<Reply> rList = mkService.replySelect(reReply.getBoardNo());
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder();
			GsonBuilder gb2 =  gb.setDateFormat("yyyy-MM-dd");
			Gson gson = gb2.create();

			try {
				gson.toJson(rList, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}

		
		}

		//좋아요 Insert
		@RequestMapping("marketLike.ma")
		public void marketBoardLike(@RequestParam("boardNo") int bNo, HttpSession session, Model model, HttpServletResponse response) {
			String id = ((Member)session.getAttribute("loginUser")).getMemberId();
			WishList wl = new WishList();
			
			wl.setBoardNo(bNo);
			wl.setMemberId (id);
			
			int result = mkService.marketLike(wl);
			
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder();
			Gson gson = gb.create();

			try {
				gson.toJson(result, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}

			
		}
		
		// 좋아요취소
			@RequestMapping("marketLikeCancle.ma")
			public  void marketBoardLikeCancle(@RequestParam("boardNo") int bNo, HttpSession session, Model model, HttpServletResponse response) {
				String id = ((Member)session.getAttribute("loginUser")).getMemberId();
				WishList wl = new WishList();
				
				wl.setBoardNo(bNo);
				wl.setMemberId (id);
				
				int result =  mkService.marketLikeCancle(wl);
				
				response.setContentType("application/json; charset=UTF-8");
				
				GsonBuilder gb = new GsonBuilder();
				Gson gson = gb.create();

				try {
					gson.toJson(result, response.getWriter());
				} catch (JsonIOException | IOException e) {
					e.printStackTrace();
				}
			}

			//게시글 수정페이지
			@RequestMapping("mkBoardUpdateView.ma")
			public String mkBoardUpdateView(@RequestParam("bNo") int bNo, Model model) {
				String strBNo = Integer.toString(bNo);
				MarketBoard mkBoard= mkService.marketBoardSelect(bNo, false);
				ArrayList<Attachment> mkAList = mkService.selectAttm(strBNo);
				
				if(mkBoard != null) {
					model.addAttribute("mkBoard", mkBoard);
					model.addAttribute("mkAList", mkAList);
					return "marketBoardEdit";
				} else {
					throw new BoardException("게시글 조회 실패.");
				}
			}
			
			
			// 게시글 수정
			@RequestMapping("marketBoardUpdate.ma")
			public String updateVolBoard(@ModelAttribute MarketBoard mkBoard, @RequestParam(value="deleteAttm", required = false) String[] deleteAttm, 
										 @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request, Model model) {
				int boardResult = mkService.marketboardUpdate(mkBoard);
				// 새파일 저장
				ArrayList<Attachment> list = new ArrayList<>();
				for(MultipartFile file : files) {
					String fileName = file.getOriginalFilename();
					if(!fileName.equals("")) {
						String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
						if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
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
				
				// 선택한 파일들 삭제
				ArrayList<String> delRename = new ArrayList<>();
				ArrayList<Integer> delLevel = new ArrayList<>();
				
				if(deleteAttm != null) {
					for (String rename : deleteAttm) {
						if (!rename.equals("")) {
							String[] split = rename.split("/");
							delRename.add(split[0]);
							delLevel.add(Integer.parseInt(split[1]));
						}
					}
				}
				
				int deleteAttmResult = 0;
				boolean existBeforeAttm = true;  // 기존 파일이 남아 있는지 확인
				
				if(!delRename.isEmpty()) {
					deleteAttmResult = mkService.deleteAttm(delRename);
					if(deleteAttmResult > 0) {
						for(String rename : delRename) {
							deleteFile(rename, request);
						}
					}
					
					if(delRename.size() == deleteAttm.length) { // 기존 파일을 전부 삭제하겠다고 한 경우
						existBeforeAttm = false;
					} else {
						for(int level : delLevel) {
							if(level == 0) {
								String strBNo = Integer.toString(mkBoard.getBoardNo());
								mkService.AttmLevelUpdate(strBNo);
								break;
							}
						}
					}
				}
				
				if(deleteAttm == null) {
					existBeforeAttm = false;
				}
				
				for(int i = 0; i < list.size(); i++) {
					Attachment a = list.get(i);
					
					if(existBeforeAttm) {
						a.setLevel(1);
					} else {
						if(i == 0) {
							a.setLevel(0);
						} else {
							a.setLevel(1);
						}
					}
					a.setImgKey("3");
				}
				
				int attmResult = 0;
				String strBNo = Integer.toString( mkBoard.getBoardNo());
				
				if(!list.isEmpty()) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("list", list);
					map.put("bNo",strBNo);
					
					attmResult = mkService.insertAttm(map);
				}
				
				if(boardResult + attmResult == 2+list.size()) {
					model.addAttribute("bNo", mkBoard.getBoardNo());
					model.addAttribute("boardWriter", mkBoard.getWriter());
					return "redirect:marketBoardDetail.ma";
				} else {
					for(Attachment a : list) {
						deleteFile(a.getImgRename(), request);
					}
					throw new BoardException("게시글 수정 실패");
				}
			}
			
			
			
			//게시글 삭제
			@RequestMapping("marketBoardDelete.ma")
			public String marketBoardDelete(@RequestParam("bNo") int bNo) {
				String strBNo = Integer.toString(bNo);
				int result = mkService.marketBoardDelete(bNo);
				result += mkService.updateAttmStatus(strBNo);
				
				
				if(result > 0) {
						return "redirect:marketBoardList.ma";
				} else {
					throw new BoardException("봉사 게시글 삭제 실패");
				}
			}
	
}
