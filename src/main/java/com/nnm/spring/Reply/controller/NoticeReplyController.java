package com.nnm.spring.Reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nnm.spring.Reply.domain.NoticeReply;
import com.nnm.spring.Reply.service.NoticeReplyService;
import com.nnm.spring.notice.domain.Notice;

@Controller
@RequestMapping("/reply")
public class NoticeReplyController {
	@Autowired
	private NoticeReplyService rService;
	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mv
								  , @ModelAttribute NoticeReply reply
								  , HttpSession session) {
		//INSERT INTO REPLY_TBL VALUES()
		String url="";
		try {
			String noticeReplyWriter = (String)session.getAttribute("memberName");
			if(noticeReplyWriter != null && !noticeReplyWriter.equals("")) {
				
				reply.setNoticeReplyWriter(noticeReplyWriter);
				int result = rService.insertNoticeReply(reply);
				url = "/notice/detail.do?noticeNo="+reply.getRefNoticeNo();
				
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글 등록이 완료되지 않았습니다");
					mv.addObject("error", "댓글등록실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
				
			}else {
				mv.addObject("msg", "로그인되지 않았습니다");
				mv.addObject("error", "로그인 정보 실패");
				mv.addObject("url", "/member/login.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}return mv;
	}
	
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public ModelAndView modifyReply(ModelAndView mv
									, @ModelAttribute NoticeReply reply
									, HttpSession session) {
		String url ="";
		try {
			String noticeReplyWriter = (String)session.getAttribute("memberName");
			if(noticeReplyWriter != null && !noticeReplyWriter.equals("")) {
				reply.setNoticeReplyWriter(noticeReplyWriter);
				int result = rService.modifyReply(reply);
				url = "/notice/detail.do?noticeNo="+reply.getRefNoticeNo();
				
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}

			}else {
				mv.addObject("msg", "로그인되지 않았습니다");
				mv.addObject("error", "로그인 정보 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteReply (ModelAndView mv
									, @ModelAttribute NoticeReply reply
									, HttpSession session) {
		String url="";
		try {
			//UPDATE REPLY_TBL SET R_STATUS = 'N' WHERE REPLY_NO = ? 
			
			String memberName= (String)session.getAttribute("memberName");
			String memberEmail= (String)session.getAttribute("memberEmail");
//			String noticeReplyWriter = (String)session.getAttribute("memberName");
			String noticeReplyWriter = reply.getNoticeReplyWriter();

			url = "/notice/detail.do?noticeNo="+reply.getRefNoticeNo();
			
			if(noticeReplyWriter != null && noticeReplyWriter.equals(memberName)){
				int result = rService.deleteReply(reply);
				if(result > 0 ) {
					mv.setViewName("redirect:"+url);
				}else {
					mv.addObject("msg", "댓글 삭제가 완료되지 않았습니다");
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
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	

}
