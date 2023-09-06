package com.nnm.spring.memberTch.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.memberTch.service.MemberTchService;

@Controller
public class MemberTchController {
	@Autowired
	private MemberTchService service;
	
	/**
	 * 강사회원가입 이동 
	 * @return
	 */
	@RequestMapping(value="/member/register3.do", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "member/register_tch";
	}
	

	/**
	 * 강사회원가입 
	 */
	@RequestMapping(value="/member/register3.do", method=RequestMethod.POST)
	public String registerMemberStd(@RequestParam("position") String position
									, @RequestParam("memberName") String memberName
									, @RequestParam("memberGender") String memberGender
									, @RequestParam("memberPhone") String memberPhone
									, @RequestParam("memberEmail") String memberEmail
									, @RequestParam("memberPw") String memberPw
									, @RequestParam("lessonFee") String lessonFee
									, @RequestParam("payment") String [] payments
									, @RequestParam("contactTime") String contactTime
									, @RequestParam("place") String [] places
									, @RequestParam("lesson") String [] lessons
									, @RequestParam("lessonType") String [] lessonTypes
									, @RequestParam("history") String history
									, @RequestParam("target") String target
									, @RequestParam("freeWords") String freeWords
									, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
									, HttpServletRequest request
									, Model model) {
		String payment = String.join(" / ", payments);
		String place = String.join(" / ", places);
		String lesson = String.join(" / ", lessons);
		String lessonType = String.join(" / ", lessonTypes);
		
		MemberTch tMember = new MemberTch(position, memberName, memberGender, memberPhone, memberEmail, memberPw, null, null, 0, lessonFee, payment, contactTime, place, lesson, lessonType, history, target, freeWords);
		
		//INSERT INTO TMEMBER_TBL VALUES ()
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
				tMember.setProPicFilename(fileName);
				tMember.setProPicFilepath(savePath);
				tMember.setProPicFilelength(fileLength);
			}
			int result = service.insertTchMember(tMember);
			if(result > 0) {
				model.addAttribute("msg", "회원가입성공!로그인해주세요!");
				model.addAttribute("url", "/member/login.do");
				return "common/successPage";
			}else {
				model.addAttribute("msg","회원가입이 완료되지 않았습니다");
				return "common/erroePage";
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
	 *강사마이페이지 이동
	 */
	@RequestMapping(value="/member/mypage_tch.do", method=RequestMethod.GET)
	public String showDetailMember(HttpSession session
								, Model model) {
		//SELECT * FROM TMEMBER_TBL WHERE MEMBER_Email = ? 
		
		String memberEmail = (String)session.getAttribute("memberEmail");
		String position =(String)session.getAttribute("position");
		MemberTch tMember = new MemberTch();
		tMember.setMemberEmail(memberEmail);
		tMember.setPosition(position);

		try {
			MemberTch tOne =  service.showOneTchById(tMember);
			if(tOne != null) {
				model.addAttribute("tMember",tOne);
				return "member/mypage_tch"; //데이터포함 
			}else{
				model.addAttribute("msg", "데이터 조회 실패");
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
	 * 강사회원 정보수정페이지 이동
	 */
	@RequestMapping(value="/member/modify_tch.do", method=RequestMethod.GET)
	public String showModifyForm(HttpSession session, Model model) {
		try {
			String memberEmail = (String)session.getAttribute("memberEmail");
			String position =(String)session.getAttribute("position");
			MemberTch tMember = new MemberTch();
			tMember.setMemberEmail(memberEmail);
			tMember.setPosition(position);
			
			MemberTch tOne = service.showOneTchById(tMember);
			if(tOne != null) {
				model.addAttribute("tMember", tOne);
				return "member/modifyInfo_tch";
			
			}else {
				model.addAttribute("msg", "데이터조회실패");
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
	 * 강사회원 정보수정 
	 */
	@RequestMapping(value="/member/modify_tch.do", method=RequestMethod.POST)
	public String modifyTchMember(@RequestParam("memberPhone") String memberPhone
								, @RequestParam("memberEmail") String memberEmail
								, @RequestParam("memberPw") String memberPw
								, @RequestParam("lessonFee") String lessonFee
								, @RequestParam("payment") String [] payments
								, @RequestParam("contactTime") String contactTime
								, @RequestParam("place") String [] places
								, @RequestParam("lesson") String [] lessons
								, @RequestParam("lessonType") String [] lessonTypes
								, @RequestParam("history") String history
								, @RequestParam("target") String target
								, @RequestParam("freeWords") String freeWords
								, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								, HttpServletRequest request
								, Model model ) {
		
		String payment = String.join(" / ", payments);
		String place = String.join(" / ", places);
		String lesson = String.join(" / ", lessons);
		String lessonType = String.join(" / ", lessonTypes);
		
		
		MemberTch tMember = new MemberTch(memberPhone, memberEmail, memberPw, null, null, 0, lessonFee, payment, contactTime, place, lesson, lessonType, history, target, freeWords);
		//UPDATE SMEMBER_TBL SET ~ WHERE MEMBER_EMAIL = ? AND MEMBER_PW =? AND MEMBER_YN = 'Y'
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
				tMember.setProPicFilename(fileName);
				tMember.setProPicFilepath(savePath);
				tMember.setProPicFilelength(fileLength);
			}
			int result = service.modifyTchMember(tMember);
			if(result > 0) {
				model.addAttribute("tMember", tMember);
				return "redirect:/member/mypage_tch.do?memberEmail="+memberEmail+"&position="+tMember.getPosition();
				
			}else {
				model.addAttribute("msg","정보수정에 실패했습니다");
				model.addAttribute("error", "조회 실패");
				model.addAttribute("url", "/member/mypage_tch.do?memberEmail="+memberEmail+"&position="+tMember.getPosition());
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
	 * 강사회원 탈퇴
	 */
	@RequestMapping(value="/member/delete_tch.do", method=RequestMethod.GET)
	public String outServiceTchMember(@RequestParam("memberEmail") String memberEmail, Model model) {
		try {
			int result = service.outServiceTchMember(memberEmail);
			if(result > 0) {
				return "redirect:/member/logout.do";
			}else {
				model.addAttribute("msg","회원탈퇴에 실패했습니다");
				model.addAttribute("error", "탈퇴 실패");
				model.addAttribute("url", "/member/mypage.do?memberEmail="+memberEmail);
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
