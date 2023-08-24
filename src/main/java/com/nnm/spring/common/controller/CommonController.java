package com.nnm.spring.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.nnm.spring.common.domain.Register;
import com.nnm.spring.common.service.CommonService;
import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;


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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
