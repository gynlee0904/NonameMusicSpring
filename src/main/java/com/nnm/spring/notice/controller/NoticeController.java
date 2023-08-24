package com.nnm.spring.notice.controller;

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

import com.nnm.spring.notice.domain.Notice;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.notice.service.NoticeService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	
	/**
	 * noticeList로 이동(+페이징)
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public String showNoticeList(@RequestParam (value="page", required=false, defaultValue="1") Integer currentPage
								, Model model) {
		//SELECT * FROM NOTICE_TBL ORDER BY NOTICE_NO DESC
		int totalCount = service.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice>nList = service.selectNoticeList(pInfo);
		try {
			if(nList.size() >0) {
				model.addAttribute("pInfo",pInfo);
				model.addAttribute("nList", nList);
				return "notice/noticeList";
				
			}else {
				model.addAttribute("msg","데이터조회가 완료되지 않았습니다");
				model.addAttribute("error", "공지목록 조회 실패");
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
	 * @param currentPage
	 * @param totalCount
	 * @return
	 */
	public PageInfo getPageInfo(int currentPage, int totalCount) {
		////SELECT COUNT (*) FROM NOTICE_TBL
		
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
	
	
	/**
	 * notice 검색시 서치페이지 이동
	 * @param searchCondition
	 * @param searchKeyword
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice/search.do", method=RequestMethod.GET)
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
		
		List<Notice>searchList = service.searchNoticeByKeyword(pInfo, paramMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			
			//서치.jsp 페이징처리
			model.addAttribute("pInfo",pInfo);			
			model.addAttribute("sList",searchList);
			return "notice/noticeSearch";

		}else {
			model.addAttribute("msg","찾는 글이 없습니다");
			model.addAttribute("error", "검색 실패");
			model.addAttribute("url", "/notice/list.do");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 글쓰기페이지로 이동
	 * @return
	 */
	@RequestMapping(value="/notice/insert.do", method=RequestMethod.GET)
	public String showInsertForm() {
		return "notice/noticeInsert";
	}
	
	
	/**
	 * 글쓰기+파일첨부
	 * @param notice
	 * @param uploadFile
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice/insert.do", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice
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
				notice.setNoticeFilename(fileName);
				notice.setNoticeFilepath(savePath);
				notice.setNoticeFilelength(fileLength);
			}
			int result = service.insertNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.do";
			
			}else {
				model.addAttribute("msg","글작성이 완료되지 않았습니다");
				model.addAttribute("error", "공지작성 실패");
				model.addAttribute("url", "/notice/insert.do");
				return "common/errorPage";
				
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/notice/insert.do");
			return "common/errorPage";
		}
	}
	
	
	
	/**
	 * 공지글상세보기(디테일)
	 * @param noticeNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
	public String detailNotice(@RequestParam ("noticeNo") Integer noticeNo
							, Model model) {
		//SELECT * FROM NOTICE_TBL WHERE NOTICE_NO=?
		Notice notice = service.selectOneDetailByNo(noticeNo);
		
		try {
			if(notice != null) {
				//가져왔으면 detail.jsp로 이동 
				model.addAttribute("notice",notice);
				return "notice/noticeDetail";
				
			}else {
				//실패시 에러페이지로 이동 
				model.addAttribute("msg","글 조회가 완료되지 않았습니다");
				model.addAttribute("error", "조회 실패");
				model.addAttribute("url", "/notice/insert.do");
				return "common/errorPage";	
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/notice/insert.do");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 글삭제
	 */
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public String deleteNotice(@RequestParam ("noticeNo") Integer noticeNo
							, Model model) {
		//DELETE FROM NOTICE_TBL WHERE NOTICE_NO = ?   
		try {
			int result = service.deleteNoticeByNo(noticeNo);
			if(result > 0) {
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg","글작성이 완료되지 않았습니다");
				model.addAttribute("error", "공지작성 실패");
				model.addAttribute("url", "/notice/insert.do");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/notice/insert.do");
			return "common/errorPage";
		}
	}
	
	/**
	 * 글수정페이지로 이동
	 */
	@RequestMapping(value="/notice/modify.do", method=RequestMethod.GET)
	public String showModifyNotice(@RequestParam ("noticeNo") Integer noticeNo
								, Model model) {
		Notice notice = service.selectOneDetailByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeModify";
	}
	
	@RequestMapping(value="/notice/modify.do", method=RequestMethod.POST)
	public String modifyNoticeByNo(@ModelAttribute Notice notice
								, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								, HttpServletRequest request
								, Model model) {
		
		//UPDATE NOTICE_TBL SET NOTICE_SUBJECT = ? , NOTICE_CONTENT = ? WHERE NOTICE_NO =? 
		
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
				notice.setNoticeFilename(fileName);
				notice.setNoticeFilepath(savePath);
				notice.setNoticeFilelength(fileLength);
			}
			int result = service.modifyNoticeByNo(notice);
			if(result > 0) {
				model.addAttribute("notice",notice);
				return "notice/noticeDetail";
				
			}else {
				model.addAttribute("msg","글 수정이 완료되지 않았습니다");
				model.addAttribute("error", "수정 실패");
				model.addAttribute("url", "/notice/insert.do");
				return "common/errorPage";	
			}
		} catch (Exception e) {
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/notice/insert.do");
			return "common/errorPage";
		}
		
		
	}
	
	

}
