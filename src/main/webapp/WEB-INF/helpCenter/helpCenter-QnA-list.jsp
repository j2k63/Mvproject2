<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="../res/css/helpCenter/helpCenter-QnA-list.css" />"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   $(document).ready(function() {

      $('#btn_submit').click(function() {
         if($('#searchtext').val() == ""){
            $('#searchtext').foucs();
            return false;
         }
         
         
         var searchtext = document.getElementById("searchtext").value;
         var isSEARCHTEXT = /^[A-Za-z0-9가-힣\s_\-]{2,11}$/;
         if (!isSEARCHTEXT.test(searchtext)) {
            alert("2~12자의 한글 및 영문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $("#searchtext").val("");
            $("#searchtext").focus();
            return false;
         }

      });
   });
</script>
<div id=wrapper>

   <div class="bodyWrapper">
      <!-- 네비부분 -->
      <div class="helpCenterIndexNavi">
         <div class="helpCenterIndexMenuDiv">
            <div class="helpCenterIndexImageDiv">
               <a href="/mvProject/main/index.do"> <img
                  src="../res/image/main/homeImage.png">
               </a>
            </div>

            <div class="helpCenterIndexNaviSecondDiv">
               <a href="/mvProject/helpCenter/index.do">> 고객센터</a>
            </div>

            <div class="helpCenterIndexNaviThirdDiv">
               <a href="/mvProject/helpCenter/Qna_list.do">> 자주찾는 질문</a>
            </div>
         </div>
      </div>

      <div class="content">

         <!--  왼쪽 메뉴 클릭 부분 -->
         <div class="col-aside">
            <div class="side_menu">
               <ul>
                  <li><a href="/mvProject/helpCenter/index.do">고객센터 메인</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_list.do">자주찾는 질문</a></li>
                  <li><a href="/mvProject/helpCenter/notice_list.do">공지/뉴스</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_emailForm.do">일대일 문의</a></li>
               </ul>
            </div>
            <!-- side_menu -->
         </div>
         <!-- col-aside -->

         <!-- 오른쪽 전체메뉴부분 -->
         <div class="col-detail">
            <div class="customer_top">
               <h2 class="title">자주찾는 질문</h2>
               <p class="subTitle">회원님들께서 가장 자주하시는 질문을 모았습니다.</p>
               <p class="subTitle">궁금하신 내용에 대해 검색해보세요.</p>
            </div>
            <form action="/mvProject/helpCenter/Qna_list.do">
               <div class="search_area">
                  <input type="text" placeholder="검색어를 입력해주세요." id="searchtext" name="searchtext" minlength="2" maxlength="20">
                  <input type="submit" id="btn_submit"
                     value="검색하기">
               </div>
            </form>
            <!-- search_area -->
            <div class="search_result">총 ${QnaTotalA }건이 검색되었습니다.</div>
            <div class="table_area">
               <table frame="hsides" rules="rows">
                  <thead>
                     <tr>
                        <th scope="col" width="60px">번호</th>
                        <th scope="col" width="580px">제목</th>
                        <th scope="col" width="120px">등록일</th>
                        <th scope="col" width="80px">조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="QnaBoardDTO" items="${QnaList }">
                        <tr>
                           <td>${QnaBoardDTO.seq }</td>
                           <td align="left" class="title"><a
                              href="/mvProject/helpCenter/Qna_view.do?seq=${QnaBoardDTO.seq }&pg=${pg}&searchtext=${searchtext}">${QnaBoardDTO.title }</a></td>
                           <td>${QnaBoardDTO.logtime }</td>
                           <td>${QnaBoardDTO.viewcount }</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            <!-- table_area div -->
            <div class="paging">${qnaBoardPaging.pagingHTML }</div>
         </div>
         <!-- col-detail -->

      </div>
      <!-- content div -->

   </div>
</div>