package com.nnm.spring.memberStd.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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
import com.nnm.spring.memberStd.service.MemberStdService;
import com.nnm.spring.memberTch.domain.MemberTch;

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
									, @RequestParam(value="place", required=false ) String place
									, @RequestParam(value="lesson", required=false ) String lesson
									, @RequestParam(value="lessonType", required=false ) String lessonType
									, @RequestParam(value="tGender", required=false ) String tGender
									, @RequestParam(value="myLevel", required=false ) String myLevel
									, @RequestParam("freeWords") String freeWords
									, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
									, HttpServletRequest request
									, Model model) {
//		String place = String.join("/", places);
//		String lesson = String.join(" / ", lessons);
		
		MemberStd sMember = new MemberStd(position, memberName, memberGender, memberPhone, memberEmail, memberPw, null, null, null, 0, place, lesson, lessonType, tGender, myLevel, freeWords);
		
		//INSERT INTO SMEMBER_TBL VALUES ()
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				//파일이름
				String fileName = uploadFile.getOriginalFilename();
				
				//파일경로
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savefolder = root+ "\\puploadFiles";
				File folder = new File(savefolder);
				
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				String savePath = savefolder + "\\"+fileName;
				File file = new File(savePath);
				
				//파일크기
				long fileLength = uploadFile.getSize();
				
				uploadFile.transferTo(file);

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
	
	
//	/**
//	 * 마이페이지 이동
//	 */
//	@RequestMapping(value="/member/mypage_std.do", method=RequestMethod.GET)
//	public String showDetailMember(@ModelAttribute MemberStd sMember
//								, Model model) {
//		//SELECT * FROM SMEMBER_TBL WHERE MEMBER_Email = ? AND MEMBER_POSITION = ? 
//		
//		try {
//			MemberStd sOne =  service.showOneStdById(sMember);
//			if(sOne != null) {
//				model.addAttribute("sMember",sOne);
//				return "member/mypage_std"; //데이터포함 
//			}else{
//				model.addAttribute("msg", "데이터 조회 실패");
//				return "common/errorPage";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();  			
//			model.addAttribute("msg","관리자에게 문의해주세요");
//			model.addAttribute("error", e.getMessage());
//			model.addAttribute("url", "/index.jsp");
//			return "common/errorPage";
//		}	
//	}
	
	/**
	 *학생마이페이지 이동(세션으로 데이터받아오기)
	 */
	@RequestMapping(value="/member/mypage_std.do", method=RequestMethod.GET)
	public String showDetailMember(HttpSession session
								, Model model) {
		//SELECT * FROM TMEMBER_TBL WHERE MEMBER_Email = ? 
		
		String memberEmail = (String)session.getAttribute("memberEmail");
		String position =(String)session.getAttribute("position");
		MemberStd sMember = new MemberStd();
		sMember.setMemberEmail(memberEmail);
		sMember.setPosition(position);

		try {
			MemberStd sOne =  service.showOneStdById(sMember);
			if(sOne != null) {
				model.addAttribute("sMember",sOne);
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
	
	
	
	/**
	 * 학생회원 정보수정페이지 이동 
	 */
	@RequestMapping(value="/member/modify_std.do", method=RequestMethod.GET)
	public String showModifyForm(HttpSession session, Model model) {
		//로그인했을때 세션에 저장된 정보를 가져와서 씀 ?
		try {
			String memberEmail = (String)session.getAttribute("memberEmail");
			String position = (String)session.getAttribute("position");
			MemberStd sMember = new MemberStd();
			sMember.setMemberEmail(memberEmail);
			sMember.setPosition(position);
			MemberStd sOne =  service.showOneStdById(sMember);
			if(sOne != null) {
				model.addAttribute("sMember",sOne);
				return "member/modifyInfo_std"; //데이터포함 
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
	 * 학생회원 정보수정 
	 */
	@RequestMapping(value="/member/modify_std.do", method=RequestMethod.POST)
	public String modifyStdMember(@RequestParam("memberPhone") String memberPhone
								, @RequestParam(value="place", required=false) String place
								, @RequestParam(value="lesson", required=false) String lesson
								, @RequestParam(value="lessonType", required=false) String lessonType
								, @RequestParam(value="tGender", required=false) String tGender
								, @RequestParam(value="myLevel", required=false) String myLevel
								, @RequestParam("freeWords") String freeWords
								, @RequestParam("position") String position
								, @RequestParam("memberEmail") String memberEmail
								, @RequestParam("memberPw") String memberPw
								, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
								, HttpServletRequest request
								, Model model) {
		
//		String place = String.join(",", places);
//		String lesson = String.join(",", lessons);
		
		//UPDATE SMEMBER_TBL SET ~ WHERE MEMBER_EMAIL = ? AND MEMBER_PW =? AND MEMBER_YN = 'Y'
		MemberStd sMember = new MemberStd(position, memberPhone, memberEmail, memberPw, null, null , 0, place, lesson, lessonType, tGender, myLevel, freeWords);
		
		try {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				String fileName = sMember.getProPicFilename(); //기존 업로드된 파일의 파일네임
				if(fileName != null) { //기존 업로드된 파일이 있는지 확인하고 있으면 삭제 
					this.deleteFile(request, fileName );  //이 클래스에 deleteFile 메소드를 만들어 사용 (request 와 fileName 을 전달받아 삭제)
				}
				
				//새 프로필사진 저장
				Map<String, Object> infoMap = this.saveFile(uploadFile, request);
				String profileName = (String)infoMap.get("fileName");
				String profileRename = (String)infoMap.get("fileRename");
				String profilePath = (String)infoMap.get("filePath");
				long profileLength = (long)infoMap.get("fileLength");

				sMember.setProPicFilename(profileName);
				sMember.setProPicFileRename(profileRename);
				sMember.setProPicFilepath(profilePath);
				sMember.setProPicFilelength(profileLength);

			}
			int result = service.modifyStdMember(sMember);
			if(result > 0) {
				model.addAttribute("sMember", sMember);
				return "redirect:/member/mypage_std.do?memberEmail="+memberEmail+"&position="+position;
				
			}else {
				model.addAttribute("msg","정보수정에 실패했습니다");
				model.addAttribute("error", "조회 실패");
				model.addAttribute("url", "/member/mypage_std.do?memberEmail="+memberEmail);
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
	 * 학생회원 탈퇴
	 */
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public String outServiceMember(@RequestParam("memberEmail") String memberEmail, Model model ) {
		//MEMBERYN => N로 바꾸기 
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
	
	
	
	//파일삭제 메소드
	public void deleteFile(HttpServletRequest request, String fileName ) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //파일 경로 가져오기 
		String delFilePath = root+"\\puploadFiles\\"+fileName;
		File file = new File(delFilePath);
		if(file.exists()) {
			file.delete();
		}
		
	}
	
	
	//파일첨부 메소드
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws IllegalStateException, IOException {
		
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		//파일이름
		String fileName = uploadFile.getOriginalFilename();
		
		
		//파일경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String saveFolder = root+ "\\puploadFiles";
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		
		//파일 리네임 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis())); //파일이름 가져오기(리네임한거)
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);	  //확장자 가져오기
		String fileRename = "P"+strResult+"."+ext;  //리네임한 결과
		String savePath = saveFolder + "\\" + fileRename;  //파일리네임으로 바꿔줘야 리네임된 파일명으로 추가됨
		File file = new File(savePath);
		
		
		//파일크기 
		long fileLength = uploadFile.getSize();
		

		//실제 파일 저장 
		uploadFile.transferTo(file);
		
		//맵에 데이터저장
		infoMap.put("fileName", fileName);
		infoMap.put("fileRename", fileRename);
		infoMap.put("savePath", savePath);
		infoMap.put("fileLength", fileLength);
		
		return infoMap;
	}
	
	
	//아이디중복체크
	@RequestMapping(value="/member/stdEmailCheck.do", method=RequestMethod.GET)
	public String stdEmailCheck(@ModelAttribute MemberStd sMember
//							  , @RequestParam("memberEmail") String memberEmail
							  , Model model ) {
		//SELECT COUNT (*) FROM SMEMBER_TBL WHERE MEMBER_EMAIL = ? 

		String memberEmail = sMember.getMemberEmail(); 
		String memberName = sMember.getMemberName(); 
		String memberGender = sMember.getMemberGender(); 
		String memberPhone = sMember.getMemberPhone(); 
		
		try {
			
			int result = service.stdEmailCheck(memberEmail);
			model.addAttribute("isChecked", "idCheck");	
//			System.out.println(result);
			if(result>0) {
				//중복아이디 있음
				model.addAttribute("sMember", sMember);
				model.addAttribute("isAvailable", "no");
				model.addAttribute("msg", "이미 사용 중인 아이디 입니다.");
				model.addAttribute("color", "red");
				return "member/register_std";
				
			}else {
				//중복아이디 없음
				model.addAttribute("sMember", sMember);
				model.addAttribute("isAvailable", "yes");	
				model.addAttribute("msg", "사용 가능한 아이디 입니다.");
				model.addAttribute("color", "blue");
				return "member/register_std";
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
