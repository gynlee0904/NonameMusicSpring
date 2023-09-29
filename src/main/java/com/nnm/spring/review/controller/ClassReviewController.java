package com.nnm.spring.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.ClassReview;
import com.nnm.spring.review.service.ClassReviewService;

@Controller
public class ClassReviewController {
	@Autowired
	private ClassReviewService cReviewService;
	
	
	@RequestMapping(value = "/review/insert.do", method = RequestMethod.POST)
	public ModelAndView insertReview(ModelAndView mv
									, @ModelAttribute ClassReview cReview
									, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
									, HttpSession session) {
		String url="";
		try {
			//INSERT INTO REPLY_TBL VALUES()
			url = "/product/class_detail.do?classNo="+cReview.getRefClassNo();
			String classReviewWriter = (String)session.getAttribute("memberName"); //작성자=로그인한 사용자 이름
			String memberEmail = (String) session.getAttribute("memberEmail");
//			if(memberEmail != null && !memberEmail.equals("")) { //로그인한 사용자만 댓글 작성 
				cReview.setClassReviewWriter(classReviewWriter); //작성자=로그인한 사용자이름
				
				int result = cReviewService.insertClassReview(cReview);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "리뷰를 등록하지 못했습니다.");
					mv.addObject("error", "리뷰등록실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
//			}else {
//				mv.addObject("msg", "로그인해야 합니다");
//				mv.addObject("error", "로그인 정보 실패");
//				mv.addObject("url", "/member/login.do");
//				mv.setViewName("common/errorPage");
//			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//**공통메소드********************************************************************************************	
	
	/**
	 * 페이지네이션 메소드
	 */
	public PageInfo getPageInfo(Integer currentPage, Integer totalCount ) {
		
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;
		int naviTotalCount;
		
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);  //Math.ceil 올림처리(데이터타입double이라 int로 형변환해줘야함)
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, naviTotalCount, totalCount);
		return pInfo;
	}
		
		
		
		
	//파일삭제 메소드
	private void deleteFile(String fileRename, HttpServletRequest request ) {
		String root = request.getSession().getServletContext().getRealPath("resources"); //파일 경로 가져오기
		String delFilepath = root+"\\ruploadFiles\\"+fileRename;
		File file = new File(delFilepath);
		if(file.exists()) {  
			file.delete();
		}
	}
			
			
	//파일첨부 메소드
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception, IOException {
		
		Map<String, Object> fileMap = new HashMap<String, Object>();  
		//resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources"); //살제 저장하고싶은 경로(resources)
		//파일 저장 경로 구하기
		String savePath = root + "\\ruploadFiles";
		//파일이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		//파일확장자구하기
		String extention = fileName.substring(fileName.lastIndexOf(".")+1);
		//시간으로 파일명 리네임하기 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extention;
		
		//파일 저장 전 폴더만들기 
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		//파일 저장 
		File saveFile = new File(savePath+"\\"+fileRename);
		uploadFile.transferTo(saveFile);  //실제 파일 저장 //체크드익셉션 =>throws Exception, IOException
		long fileLength = uploadFile.getSize(); //파일크기 
		
		//파일정보 리턴 
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/ruploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;		
	}
}
