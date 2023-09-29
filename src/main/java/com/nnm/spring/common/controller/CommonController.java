package com.nnm.spring.common.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nnm.spring.common.domain.Board;
import com.nnm.spring.common.domain.Register;
import com.nnm.spring.common.service.CommonService;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;


@Controller

public class CommonController {
	@Autowired
	private CommonService service;
	
	/**
	 * 회원가입 첫페이지 이동
	 * @return
	 */
	@RequestMapping(value="/member/register1.do", method=RequestMethod.GET)
	public String registerFirstForm() {
		return "member/register_first";
	}
	
	/**
	 * 회원가입 첫페이지 
	 * @return
	 */
	@RequestMapping(value="/member/register1.do", method=RequestMethod.POST)
	public String registerMember(@RequestParam("policy") String policy 
								, @RequestParam("position") String position 
								, Model model) {
		Register regi = new Register(policy, position);
		try {
			if(position.equals("std")) {
				model.addAttribute("register", regi);
				return "member/register_std";
				
			}else if(position.equals("tch")) {
				model.addAttribute("register", regi);
				return "member/register_tch";
				
			}else {
				// 진입실패
				model.addAttribute("msg", "회원가입을 진행할수 없습니다");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();  			
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	
	/**
	 * 로그인페이지 이동
	 * @return
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}
	

	/**
	 * 로그인
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String memberLogin(@RequestParam("position") String position
							, @RequestParam("memberEmail") String memberEmail
							, @RequestParam("memberPw") String memberPw
							, HttpSession session
							, Model model) {
		//SELECT * FROM SMEMBER_TBL WHERE MEMBER_EMAIL = ? AND MEMBER_PW = ? AND MEMBER_POSITION =? 
		try {
			MemberStd sMember = new MemberStd(position, memberEmail, memberPw);
			MemberTch tMember = new MemberTch(position, memberEmail, memberPw);
			
			if(position.equals("std")) {
				MemberStd sOne = service.SMemberLoginCheck(sMember);
				if(sOne != null) {
					session.setAttribute("memberEmail", sOne.getMemberEmail());
					session.setAttribute("memberName", sOne.getMemberName());
					session.setAttribute("position", sOne.getPosition());
					
				}
			}else if(position.equals("tch")) {
				MemberTch tOne = service.TMemberLoginCheck(tMember);
				if(tOne != null) {
					session.setAttribute("memberEmail", tOne.getMemberEmail());
					session.setAttribute("memberName", tOne.getMemberName());
					session.setAttribute("position", tOne.getPosition());
				}
			}else {
				//로그인 실패
				model.addAttribute("msg", "로그인에 실패했습니다");
				return "common/errorPage";
			}
			return "redirect:/index.jsp"; 
			
		} catch (Exception e) {
			e.printStackTrace();  			
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}		
	}
	
	
	/**
	 * 로그아웃
	 */
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String memberLogout (HttpSession session, Model model) {
		try {
			if(session != null) {
				session.invalidate();
				return"redirect:/index.jsp";
			}else {
				model.addAttribute("msg", "로그아웃에 실패했습니다");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();  			
			model.addAttribute("msg","관리자에게 문의해주세요");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
		
	}

	
	
//	public String showBoardList(@RequestParam (value="page", required=false, defaultValue="1") Integer currentPage
//								, Model model) {
//		//SELECT * FROM NOTICE_TBL UNION ALL SELECT * FROM FREEBOARD_TBL;
//		int totalCount = service.getListCount();
//		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
//		List<Board>bList = service.selectAllBoardList(pInfo);
//		
//		try {
//			if(bList.size() >0) {
//				model.addAttribute("pInfo",pInfo);
//				model.addAttribute("bList", bList);
//				return "/index.jsp";
//				
//			}else {
//				model.addAttribute("msg","데이터조회가 완료되지 않았습니다");
//				model.addAttribute("error", "공지목록 조회 실패");
//				model.addAttribute("url", "/index.jsp");
//				return "common/errorPage";
//			}
//		} catch (Exception e) {
//			model.addAttribute("msg","관리자에게 문의해주세요");
//			model.addAttribute("error", e.getMessage());
//			model.addAttribute("url", "/index.jsp");
//			return "common/errorPage";
//		}
//	}
	
	
	
	
	
	
	
	/**
	 * 페이징처리
	 */
	public PageInfo getPageInfo(int currentPage, int totalCount) {
		////SELECT COUNT (*) FROM NOTICE_TBL
		
		PageInfo pi = null;
		int recordCountPerPage = 5; //한페이지에 보여줄 게시물 갯수
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
		pi= new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, naviTotalCount, totalCount);
		return pi;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
