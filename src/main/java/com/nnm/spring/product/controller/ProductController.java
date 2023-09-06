package com.nnm.spring.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.nnm.spring.memberTch.domain.MemberTch;
import com.nnm.spring.notice.domain.PageInfo;
import com.nnm.spring.product.domain.MyClass;
import com.nnm.spring.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService pService;
	
	/**
	 * 클래스등록 페이지로 이동
	 */
	@RequestMapping(value="/insertClass.do", method=RequestMethod.GET)
	public ModelAndView showinsertClassForm(ModelAndView mv) {
		mv.setViewName("product/insertClass"); 
		return mv;
	}
	
	
	/**
	 * 클래스등록 
	 */
	@RequestMapping(value="/insertClass.do", method=RequestMethod.POST)
	public ModelAndView insertClass(ModelAndView mv
									, @ModelAttribute MyClass myClass
									, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
									, HttpSession session
									, HttpServletRequest request) {
		//INSERT INTO MY_CLASS_LIST_TBL VALUES ()
		String url = "";
		try {
			String memberEmail = (String)session.getAttribute("memberEmail");
			String classWriter = (String)session.getAttribute("memberName");
			url = "/product/my_class_list.do?memberEmail="+memberEmail;
			
			if(memberEmail != null && !memberEmail.equals("")) {
				myClass.setMemberEmail(memberEmail);
				myClass.setClassWriter(classWriter);
				
				//프로필사진 업로드
				if(uploadFile !=null && !uploadFile.getOriginalFilename().equals("")) {
					//파일정보(이름, 리네임, 경로, 크기) 및 파일저장 
					Map<String, Object> cMap = this.saveFile(request, uploadFile);
					myClass.setClassFilename((String)cMap.get("fileName")); //맵이 Object이기때문에 String으로 형변환
					myClass.setClassFileRename((String)cMap.get("fileRename")); //("")안에는 키값과 맞춤
					myClass.setClassFilepath((String)cMap.get("filePath"));
					myClass.setClassFilelength((long)cMap.get("fileLength"));
				}
				
				Integer result = pService.insertClass(myClass);
				if(result>0) {
					mv.setViewName("redirect:"+url);
					
				}else {
					mv.addObject("msg", "클래스 등록이 완료되지 않았습니다");
					mv.addObject("error", "클래스 등록 실패 ");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
				
			}else {
				mv.addObject("msg", "로그인해야 클래스등록이 가능합니다");
				mv.addObject("error", "클래스등록이 불가");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "클래스 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 마이페이지_tch에서 마이클래스목록으로 이동(+페이징)
	 */
	@RequestMapping(value="/my_class_list.do", method=RequestMethod.GET)
	public ModelAndView showMyClassList(ModelAndView mv
//										,@RequestParam MyClass myClass
										,HttpSession session
										,@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		
		//SELECT COUNT (*) FROM MY_CLASS_LIST_TBL MEMBER_EMAIL = memberEmail; 
		String memberEmail = (String)session.getAttribute("memberEmail");
//		String classWriter = (String)session.getAttribute("memberName");
		
		Integer totalCount = pService.getListCount(memberEmail);
		PageInfo pInfo = this.getPageInfo(5, currentPage, totalCount);
		List<MyClass>cList = pService.selectMyClassList(memberEmail, pInfo);
		try {
			if(cList.size()>0) {
				mv.addObject("cList", cList).addObject("memberEmail", memberEmail).addObject("pInfo", pInfo).setViewName("product/myClassList");
				
			}else {
				mv.addObject("msg", "등록된 클래스가 없습니다").setViewName("product/myClassList");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "클래스 목록 조회에 실패했습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/member/mypage_tch.do?memberEmail="+memberEmail);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/**
	 * 전체 클래스메뉴 들어가기(+페이징)
	 */
	@RequestMapping(value="/all_class_list.do", method=RequestMethod.GET)
	public ModelAndView showMyClassList(ModelAndView mv
										,@ModelAttribute MyClass myClass
//										,HttpSession session
										,@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		
		//SELECT COUNT (*) FROM MY_CLASS_LIST_TBL;
//		String memberEmail = myClass.getMemberEmail();
//		String classWriter = myClass.getClassWriter();
		
		Integer totalCount = pService.getAllClassListCount();
		PageInfo pInfo = this.getPageInfo(9, currentPage, totalCount);
		List<MyClass>cList = pService.selectAllClassList(pInfo);
		try {
			
			if(cList.size()>0) {
				mv.addObject("cList", cList).addObject("pInfo", pInfo).setViewName("product/classList");
				
			}else {
				mv.addObject("msg", "등록된 클래스가 없습니다").setViewName("product/classList");
			}
			
			
		} catch (Exception e) {
			mv.addObject("msg", "클래스 리스트 조회를 실패했습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/class_detail.do", method=RequestMethod.GET)
	public ModelAndView showClassDetail(ModelAndView mv
										, @RequestParam ("classNo") Integer classNo
										, HttpSession session) {
		//SELECT * FROM CLASS_LIST_TBL WHERE CLASS_NO = classNo
//		String memberEmail = (String)session.getAttribute("memberEmail");
//		String memberName =  (String)session.getAttribute("memberName");
//		if(memberEmail != null && !memberEmail.equals("")) {
			try {
				MyClass classOne =  pService.selectClassByNo(classNo) ;
				if(classOne != null) {
					mv.addObject("classOne", classOne);
					mv.setViewName("product/reservation1");
				}else {
					mv.addObject("msg", "게시글 조회를 실패했습니다");
					mv.addObject("error", "게시글 상세조회 실패 ");
					mv.addObject("url", "/product/all_class_list.do");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				mv.addObject("msg", "게시글 조회가 되지않았습니다");
				mv.addObject("error", e.getMessage());
				mv.addObject("url", "/product/all_class_list.do");
				mv.setViewName("common/errorPage");
			}
//		}
		return mv;
	}
	
	
	
//**********************************************************************************************	
	
	/**
	 * 페이지네이션 메소드
	 */
	public PageInfo getPageInfo(Integer recordCountPerPage, Integer currentPage, Integer totalCount ) {
		
//		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
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
			String delFilepath = root+"\\cuploadFiles\\"+fileRename;
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
			String savePath = root + "\\cuploadFiles";
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
			fileMap.put("filePath", "../resources/cuploadFiles/"+fileRename);
			fileMap.put("fileLength", fileLength);
			
			return fileMap;		
		}
	
	
	
	
	
}
