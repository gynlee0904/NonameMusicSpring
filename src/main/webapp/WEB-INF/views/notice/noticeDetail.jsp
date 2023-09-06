<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지 보기</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/board/noticeDetail.css">
        <link rel="stylesheet" href="../resources/css/footer.css">
        <link rel="stylesheet" href="../resources/css/reset.css">

        <!--헤더폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:wght@500&display=swap" rel="stylesheet">
        <!--본문폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
        
        <!--Bootstrap 아이콘cdn -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    </head>

    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>

 <!-- **************************************************************************** -->
            
            <main>
                <div id="whole_layer">

                    <aside id="aside">
                        <div id="aside_layer1"></div>
                        <div id="menu_container">
                            <button class="menuBtn" id="menu_notice" onclick="toggleButton(1); locate1();">공지사항</button>
                            <button class="menuBtn" id="menu_free" onclick="toggleButton(2); locate2();">자유게시판</button> 
                            <button class="menuBtn" id="menu_playing" onclick="toggleButton(3)">연주 영상</button>
                            <button class="menuBtn" id="menu_market" onclick="toggleButton(4)">거래게시판</button>
                        </div>
                        <div id="aside_layer3"></div>
                    </aside>
                    
                    <section id="main_layer1">
                        <section id="board_name">
                            <h1>공지사항</h1>
                        </section>
                        
                        <section id="board_content">
                        	<section id="content_layer">
	                            <div id="content_wrap">
	                            	<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
	                                <div id="noticeSubject">${notice.noticeSubject}</div>
	                                <div id="noticeview">
										<fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${notice.nCreateDate }"/>, 조회수
									</div>
									
	                                <div id="noticeContent">
	                                	<c:if test="${!empty notice.noticeFilename }"><img src="../resources/nuploadFiles/${notice.noticeFilename }" alt="#"  ><br>${notice.noticeContent}</c:if>
										<c:if test="${empty notice.noticeFilename }"> ${notice.noticeContent}</c:if>
	                                </div>
	                                <div id="file_wrap">
	                                    <div>
	                                        ${notice.noticeFilename}
	                                    </div>
	                                    <div>
	                                        <input type="text" name="noticeWriter" value="관리자" readonly>
	                                    </div>
	                                </div>
	                            </div>
	                            <div id="btn_wrap">
	                                <div>
	                                    <button id="returnListBtn" onclick="returnList()">돌아가기</button>
	                                </div>
	                                <div>
	                                    <a href="/notice/modify.do?noticeNo=${notice.noticeNo}"><button id="modifybtn" >수정하기</button></a>
	                                    <a href="javascript:void(0)" onclick="checkDelete();"><button id="deleteBtn" >삭제하기</button></a>
	                                </div>
	                            </div>	
                        	</section>
<!-- ******************************************댓글목록****************************************************************** -->
                            <br>

                            <section id="comment_layer">
                                <div id="comment_open">
                                    <button id="viewCommentBtn" onclick="openReply()">
                                        Comments 'count'
                                    </button>
                                </div>
                                <div id="comment_wrap" style="display:none;">
                                    <section id="commen_list">
                                        <ul>
                                            <c:forEach var="reply" items="${nrList }" > 
                                                <li>
                                                    <div class="commen" id="ReplyBox">
                                                        <div id="reply_head">
                                                            <div id="reply_noWriter">
                                                                # ${reply.noticeReplyNo} - ${reply.noticeReplyWriter }
                                                            </div>
                                                            <div id="reply_nDate">
                                                                <fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${ reply.nrCreateDate}"/>
                                                            </div>
                                                        </div>
                                                        
                                                        <div id="reply_content" >
                                                        	${reply.noticeReplyContent }
                                                        </div>
                                                        
                                                        <div  id="reply_foot">
                                                            <div id="re_replyBtn">
                                                                <button type="submit" name="insertReplyBtn" class="btn"><i class="bi bi-arrow-return-right"></i>답글달기</button>
                                                            </div>
                                                            <div id="reply_edit_btn">
                                                                <button type="button" name="replymodifyBtn" onclick="showModifyForm(this)">수정</button>
                                                                
                                                            	<c:url var="delUrl" value="/reply/delete.do">
                                                            		<c:param name="noticeReplyNo" value="${reply.noticeReplyNo }"/>
                                                            		<c:param name="noticeReplyWriter" value="${reply.noticeReplyWriter }"/> <!-- 자기가쓴댓글만 삭제하도록 -->
                                                            		<c:param name="refNoticeNo" value="${reply.refNoticeNo }"/> <!-- 삭제성공시 노티스디테일.jsp로 가도록 -->
                                                            	</c:url>    
                                                                
                                                                <button type="button" name="replydeleteBtn" onclick="deleteReply('${delUrl}');">삭제</button>
                                                            </div>
                                                        </div>
                                                    </div>
    
    
<!-- *************************************************댓글수정폼***************************************************************** -->   
                                                    <div class="replyModifyForm"  style="display:none;"> 
                                                        <form action="/reply/modify.do" method="post"> 
                                                            <input type="hidden" name="noticeReplyNo" value="${reply.noticeReplyNo }"> 
                                                            <input type="hidden" name="refNoticeNo" value="${reply.refNoticeNo }">
                                                            <div class="commen" id="modifyReplyBox"> 
                                                                <div id="modify_reply_head"> 
                                                                    <i class="bi bi-arrow-return-right"></i>댓글수정 # ${reply.noticeReplyNo} 
                                                                </div>            
                                                                <div id="modify_reply_content"> 
                                                                    <textarea name="noticeReplyContent" spellcheck="false">${reply.noticeReplyContent}</textarea> 
                                                                </div>         
                                                                <div id="modify_reply_foot"> 
                                                                    <div id="modify_reply_attachFile"> 
                                                                        <input type="file" name="replyAttachFile"> 
                                                                    </div> 
                                                                    <div id="modify_reply_edit"> 
                                                                        <input type="text" name="noticeReplyWriter" value="${reply.noticeReplyWriter}" readonly> 
                                                                        <input type="hidden" name="memberEmail" value="${memberEmail}">
                                                                        <button type="submit" id="modifyReplyBtn" onclick="replyModify(this,'${reply.noticeReplyNo}','${reply.refNoticeNo}')" >수정완료</button> 
                                                                    </div> 
                                                                </div>    
                                                            </div>	
                                                        </form> 
                                                    </div>		 
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </section>
<!-- ******************************************댓글작성****************************************************************** -->
    
                                    <section id="comment_insert">
                                        <form action="/reply/insert.do" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name=refNoticeNo value="${notice.noticeNo}">
                                            <div class="commen" id="insertReplyBox">
                                            
                                                <div id="insert_reply_head">
                                                    <i class="bi bi-arrow-return-right"></i>댓글달기
                                                </div>
                                                
                                                <div id="insert_reply_content">
                                                    <textarea name="noticeReplyContent" spellcheck="false"></textarea>
                                                    <!--  <input type="text" name="replyContent"> -->
                                                </div>
                                                
                                                <div id="insert_reply_foot">
                                                    <div id="reply_attachFile">
                                                        <input type="file" name="replyAttachFile">
                                                    </div>
                                                    <div id="reply_writer">
                                                        <input type="text" name="noticeReplyWriter" value="${reply.noticeReplyWriter}" readonly>
                                                        <input type="hidden" name="memberEmail" value="${memberEmail}">
                                                        <button type="submit" name="insertReplyBtn" >댓글달기</button>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </form>
                                    </section>
                                    <section>
		                                <div>
		                                    <button id="topScroll"><i class="bi bi-chevron-double-up"></i>TOP</button>
		                                </div>
		                            </section>
                                </div>
                            </section>
                            
                           
                        </section>
                    </section>
                </div>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        
      	<script>	
// 	      	function scrollToComment() {
// 	            // 현재 스크롤 위치를 가져옵니다.
// 	            const currentScroll = window.scrollY 
	
// 	            // 스크롤되지 않은 상태라면 댓글 섹션으로 스크롤합니다.
// 	            if (currentScroll == "") {
// 	                const commentWrap = document.getElementById("comment_wrap");
// 	                const commentTop = commentWrap.offsetTop;
// 	                window.scrollTo({
// 	                    top: currentScroll,
// 	                    behavior: "smooth"
// 	                });
// 	            }
// 	        }
       	
       		//사이드바 공지버튼 공지게시판으로 이동 
            function locate1 (){
                location.href='/notice/list.do?page=1'
            }
          	//사이드바 자게버튼 자게로 이동 
            function locate2 (){
                location.href='/free/list.do?page=1'
            }
            
          	
          	//리스트로 돌아가기 
          	function returnList(){
          		location.href = '/notice/list.do?page=1'  //추후 게시글이 있는 페이지로 돌아가도록 수정하기!!
          		
          	}
          	
          	
          	//게시글 삭제버튼 
            function checkDelete(){
				const noticeNo = '${notice.noticeNo}'
				if(confirm ("정말 삭제하시겠습니까? 삭제후엔 복구할 수 없습니다.")){
					location.href = "/notice/delete.do?noticeNo="+noticeNo;
				}//확인(true) 눌렀을때만 삭제되도록  //취소누르면 실행문이 동작 안함 
			}
          	
          	
          	
            let toggleFlag = false;  
            //댓글리스트 오픈 
          	function openReply(){
          		const commentList = document.querySelector("#comment_wrap");
          		if(toggleFlag){
          			commentList.style.display="none";
            	}else {
            		commentList.style.display="block";
            	}
            	toggleFlag = !toggleFlag;          		
          	}

            
            //댓글수정하기버튼- 수정폼오픈
            function showModifyForm(obj) {            	 
            	const replymodifyForm = obj.parentElement.parentElement.parentElement.nextElementSibling
            	if(toggleFlag){
            		replymodifyForm.style.display="none";
            	}else {
            		replymodifyForm.style.display="block";
            	}
            	toggleFlag = !toggleFlag;
			}
            

            //댓글 수정완료버튼 - 수정완료
            function replyModify(obj, noticeReplyNo, refNoticeNo){
            	scrollToComment();
            	obj.parentElement.parentElement.previousElementSibling.childNodes[0].value;
  				//스크롤유지
             	// history.scrollRestoration = "manual"; //뒤로가기했을 때 스크롤 유지하는 코드인듯..
             	// e.preventDefault();  	
            }
            
            
            //댓글삭제확인
            function deleteReply(url) {
				if(confirm ("정말 삭제하시겠습니까? 삭제후에는 복구할 수 없습니다")){
					location.href=url;
				}
			}
            
            
            //TOP버튼 누르면 페이지 최상단으로 이동
            const topScrollBtn = document.getElementById("topScroll");
            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: "smooth"
                });
            }
            topScrollBtn.addEventListener("click", scrollToTop);
            
            
            
            
	            
     
	
      </script>
              
    </body>
</html>