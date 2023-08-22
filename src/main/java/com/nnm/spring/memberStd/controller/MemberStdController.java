package com.nnm.spring.memberStd.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nnm.spring.memberStd.domain.MemberStd;
import com.nnm.spring.memberStd.service.MemberStdService;

@Controller
public class MemberStdController {
	@Autowired
	private MemberStdService service;
	
	/**
	 * 학생회원가입 이동
	 */
	@RequestMapping(value="/member/register2.do", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "member/register_std";
	}
	
	
	/**
	 * 학생회원가입
	 */
	@RequestMapping(value="/member/register2.do", method=RequestMethod.POST)
	public String registerMemberStd(@RequestParam("position") String position
									, @RequestParam("memberName") String memberName
									, @RequestParam("memberGender") String memberGender
									, @RequestParam("memberPhone") String memberPhone
									, @RequestParam("memberEmail") String memberEmail
									, @RequestParam("memberPw") String memberPw
									, @RequestParam("place") String [] places
									, @RequestParam("lesson") String [] lessons
									, @RequestParam("lessonType") String lessonType
									, @RequestParam("tGender") String tGender
									, @RequestParam("myLevel") String myLevel
									, @RequestParam("freeWords") String freeWords
									, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
									, HttpServletRequest request
									, Model model) {
		String place = String.join(",", places);
		String lesson = String.join(",", lessons);
		
		MemberStd sMember = new MemberStd(position, memberName, memberGender, memberPhone, memberEmail, memberPw, null, null, 0, place, lesson, lessonType, tGender, myLevel, freeWords);
		
		//INSERT INTO SMEMBER_TBL VALUES ()
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
				sMember.setProPicFilename(fileName);
				sMember.setProPicFilepath(savePath);
				sMember.setProPicFilelength(fileLength);
			}
			int result = service.insertStdMember(sMember);
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
	 * 마이페이지 이동
	 * @param memberId
	 * @param model
	 * @return
	 */
	
	@RequestMapping(value="/member/mypage.do", method=RequestMethod.GET)
	public String showDetailMember(@RequestParam("memberEmail") String memberEmail
								, Model model) {
		//SELECT * FROM MEMBER_TBL WHERE MEMBER_Email = ? 
		
		try {
			MemberStd sMember =  service.showOneStdById(memberEmail);
			if(sMember != null) {
				model.addAttribute("sMember",sMember);
				return "member/mypage_std"; //데이터포함 
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
	
	
	@RequestMapping(value="/member/modify_std.do", method=RequestMethod.GET)
	public String showModifyForm(@RequestParam ("memberEmail") String memberEmail, Model model) {
		MemberStd sMember = service.showOneStdById(memberEmail);
		model.addAttribute("sMember", sMember);
		return "member/modifyInfo_std";
	}
	
	
	@RequestMapping(value="/member/modify_std.do", method=RequestMethod.POST)
	public String modifyStdMember(@RequestParam("memberPhone") String memberPhone
								, @RequestParam("memberEmail") String memberEmail
								, @RequestParam("memberPw") String memberPw
								, @RequestParam("place") String [] places
								, @RequestParam("lesson") String [] lessons
								, @RequestParam("lessonType") String lessonType
								, @RequestParam("tGender") String tGender
								, @RequestParam("myLevel") String myLevel
								, @RequestParam("freeWords") String freeWords
								, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								, HttpServletRequest request
								, Model model) {
		
		String place = String.join(",", places);
		String lesson = String.join(",", lessons);
		
		//UPDATE SMEMBER_TBL SET ~ WHERE MEMBER_EMAIL = ? AND MEMBER_PW =? AND MEMBER_YN = 'Y'
		MemberStd sMember = new MemberStd(memberPhone, memberEmail, memberPw, null, null, 0, place, lesson, lessonType, tGender, myLevel, freeWords);
		try {
//			if(!uploadFile.getOriginalFilename().equals("")) {
//				//파일이름
//				String fileName = uploadFile.getOriginalFilename();
//				
//				//파일경로
//				String root = request.getSession().getServletContext().getRealPath("resources");
//				String savefolder = root+ "\\nuploadFiles";
//				File folder = new File(savefolder);
//				
//				if(!folder.exists()) {
//					folder.mkdir();
//				}
//				
//				String savePath = savefolder + "\\"+fileName;
//				File file = new File(savePath);
//				
//				uploadFile.transferTo(file);
//				
//				//파일크기
//				long fileLength = uploadFile.getSize();
//				sMember.setProPicFilename(fileName);
//				sMember.setProPicFilepath(savePath);
//				sMember.setProPicFilelength(fileLength);
//			}
						
			int result = service.modifyStdMember(sMember);
			if(result > 0) {
				model.addAttribute("sMember", sMember);
				return "member/mypage_std";
				
			}else {
				model.addAttribute("msg","정보수정에 실패했습니다");
				model.addAttribute("error", "조회 실패");
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
	
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public String outServiceMember(@RequestParam("memberEmail") String memberEmail, Model model ) {
		try {
			int result = service.outServiceStdMember(memberEmail);
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
