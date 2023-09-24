package com.nnm.spring.Reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nnm.spring.Reply.domain.NoticeReply;
import com.nnm.spring.Reply.service.NoticeReplyService;
import com.nnm.spring.notice.domain.Notice;

@Controller
@RequestMapping("/reply")
public class NoticeReplyController {
	@Autowired
	private NoticeReplyService rService;
	
	/**
	 *댓글등록
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mv
								  , @ModelAttribute NoticeReply nReply
//								  , @RequestParam ("memberEmail") String memberEmail 
								  , HttpSession session) {
		String url="";
		try {
			//INSERT INTO REPLY_TBL VALUES()
			url = "/notice/detail.do?noticeNo="+nReply.getRefNoticeNo();
			String noticeReplyWriter = (String)session.getAttribute("memberName"); //작성자=로그인한 사용자 이름
			String memberEmail = (String)session.getAttribute("memberEmail");
			
			if(memberEmail != null && !memberEmail.equals("")) { //로그인한 사용자만 댓글 작성 
				nReply.setNoticeReplyWriter(noticeReplyWriter); //작성자=로그인한 사용자 아이디(이멜)로 세팅? 이 값이 컬럼에 저장되는건지?
				
				int result = rService.insertNoticeReply(nReply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글을 등록하지 못했습니다.");
					mv.addObject("error", "댓글등록실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
				
			}else {
				mv.addObject("msg", "로그인해야 합니다");
				mv.addObject("error", "로그인 정보 실패");
				mv.addObject("url", "/member/login.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}return mv;
	}
	
	/**
	 * 댓글수정
	 */
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public ModelAndView modifyReply(ModelAndView mv
									, @ModelAttribute NoticeReply nReply
									,@RequestParam ("memberEmail") String memberEmail
									, HttpSession session) {
		String url ="";
		try {
			//UPDATE REPLY_TBL SET NOTICE_REPLY_CONTENT = ? WHERE REPLY_NO = ? 
			url = "/notice/detail.do?noticeNo="+nReply.getRefNoticeNo();
			
			memberEmail = (String)session.getAttribute("memberEmail");
			String noticeReplyWriter = (String)session.getAttribute("memberName");  
			
			if(noticeReplyWriter != null && noticeReplyWriter.equals(memberEmail)) { //로그인+댓쓴사람만 수정 가능 
				
				int result = rService.modifyReply(nReply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글을 수정하지 못했습니다.");
					mv.addObject("error", "댓글수정실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
				
			}else {
				mv.addObject("msg", "자신이 작성한 댓글만 수정할 수 있습니다");
				mv.addObject("error", "댓글 수정 불가");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 *댓글 삭제(비공개)
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReply (ModelAndView mv
									, @ModelAttribute NoticeReply nReply
									, HttpSession session) {
		String url="";
		try {
			//UPDATE REPLY_TBL SET R_STATUS = 'N' WHERE REPLY_NO = ? 
			url = "/notice/detail.do?noticeNo="+nReply.getRefNoticeNo();
			
			String noticeReplyWriter = (String)session.getAttribute("memberEmail");  
			String memberEmail = nReply.getNoticeReplyWriter();
			
			
			if(noticeReplyWriter != null && noticeReplyWriter.equals(memberEmail)){ //로그인+댓쓴사람만 삭제 가능
				int result = rService.deleteReply(nReply);
				if(result > 0 ) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글을 삭제하지 못했습니다.");
					mv.addObject("error", "댓글 삭제 실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
			}else {
				mv.addObject("msg", "자신이 작성한 댓글만 삭제할 수 있습니다");
				mv.addObject("error", "댓글 삭제 불가");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의해주세요");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	

}
