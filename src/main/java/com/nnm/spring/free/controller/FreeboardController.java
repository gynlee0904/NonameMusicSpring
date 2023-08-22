package com.nnm.spring.free.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nnm.spring.free.domain.Freeboard;
import com.nnm.spring.free.service.FreeboardService;
import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;

@Controller
public class FreeboardController {
	@Autowired
	private FreeboardService service;
	
	
	/**
	 * freeList로 이동(+페이징)
	 */
	@RequestMapping(value="/free/list.do", method=RequestMethod.GET)
	public String showFreeList(@RequestParam (value="page", required=false, defaultValue="1") Integer currentPage
							  , Model model) {
		int totalCount = service.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Freeboard>fList = service.selectFreeList(pInfo);
		
		try {
			if(fList.size() >0) {
				model.addAttribute("pInfo",pInfo);
				model.addAttribute("fList", fList);
				return "freeboard/freeList";
				
			}else {
				model.addAttribute("msg","데이터조회가 완료되지 않았습니다");
				model.addAttribute("error", "게시판목록 조회 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	
	/**
	 * 페이징처리
	 */
	public PageInfo getPageInfo(int currentPage, int totalCount) {
		////SELECT COUNT (*) FROM FREEBOARD_TBL
		
		PageInfo pi = null;
		int recordCountPerPage = 15; //한페이지에 보여줄 게시물 갯수
		int naviCountPerPage = 5; //한페이지에 보여줄 네비의 갯수
		int naviTotalCount;
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);  //정수로 강제형변환 
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		//??? currentPage 값이 1~5일 떄 startNavi가 1로 고정되도록 구해주는 식 ???
		
		endNavi = startNavi + naviCountPerPage-1;
		
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
			//endNavi는 startNavi에 무조건 naviCountPerPage값을 더하므로 실제 최대값보다 커질 수 있음
			//커지면 naviTotalCount 값으로 넣어주는 식 ↓
		}
		pi= new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, naviTotalCount, naviTotalCount);
		return pi;
	}

	@RequestMapping(value="/free/search.do", method=RequestMethod.GET)
	public String searchNoticeList(@RequestParam("searchCondition") String searchCondition
			 					, @RequestParam("searchKeyword") String searchKeyword 
			 					, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			 					, Model model) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		
		//서치.jsp 페이징처리
		int totalCount = service.getListCount(paramMap);
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		
		List<Freeboard>searchList = service.searchFreeboardByKeyword(pInfo, paramMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
		
			//서치.jsp 페이징처리
			model.addAttribute("pInfo",pInfo);			
			model.addAttribute("fsList",searchList);
			return "freeboard/freeSearch";
		
		}else {
			model.addAttribute("msg","찾는 글이 없습니다");
			model.addAttribute("error", "검색 실패");
			model.addAttribute("url", "/free/list.do");
			return "common/errorPage";
		}
	}	
	
	
	
	
	
	/**
	 * free글작성이동
	 * @return
	 */
	@RequestMapping(value="/free/insert.do", method=RequestMethod.GET)
	public String showInsertForm() {
		return "freeboard/freeInsert";
	}
	
	
	/**
	 * free글작성+파일첨부
	 */
	@RequestMapping(value="/free/insert.do", method=RequestMethod.POST)
	public String insertFreeboard(@ModelAttribute Freeboard freeboard
							, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
							, HttpServletRequest request
							, Model model) {
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
				//파일이름
				String fileName = uploadFile.getOriginalFilename();
				
				//파일경로
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savefolder = root+ "\\nuploadFiles";
				File folder = new File(savefolder);
				
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				String savePath = savefolder + "\\"+fileName;
				File file = new File(savePath);
				
				uploadFile.transferTo(file);
				
				//파일크기
				long fileLength = uploadFile.getSize();
				freeboard.setFreeFilename(fileName);
				freeboard.setFreeFilepath(savePath);
				freeboard.setFreeFilelength(fileLength);
			}
			int result = service.insertFree(freeboard);
			if(result > 0) {
				return "redirect:/free/list.do";
			
			}else {
				model.addAttribute("msg","글작성이 완료되지 않았습니다");
				model.addAttribute("error", "공지작성 실패");
				model.addAttribute("url", "/free/insert.do");
				return "common/errorPage";
				
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/free/insert.do");
			return "common/errorPage";
		}
	}
	
	/**
	 * 자게 글상세보기(디테일)
	 */
	@RequestMapping(value="/free/detail.do", method=RequestMethod.GET)
	public String detailFreeboard(@RequestParam ("freeNo") Integer freeNo
							, Model model) {
		//SELECT * FROM FREEBOARD_TBL WHERE FREE_NO=?
		Freeboard freeboard = service.selectOneDetailByNo(freeNo);
		
		try {
			if(freeboard != null) {
				//가져왔으면 detail.jsp로 이동 
				model.addAttribute("freeboard",freeboard);
				return "freeboard/freeDetail";
				
			}else {
				//실패시 에러페이지로 이동 
				model.addAttribute("msg","글 조회가 완료되지 않았습니다");
				model.addAttribute("error", "조회 실패");
				model.addAttribute("url", "/free/insert.do");
				return "common/errorPage";	
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/free/insert.do");
			return "common/errorPage";
		}
	}
}
