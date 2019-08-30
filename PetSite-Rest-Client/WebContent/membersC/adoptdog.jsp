<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%session.setAttribute("id", "ukpyo");%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="../css/bootstrap.css" rel="stylesheet" />
<link href="../css/coming-sssoon.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Grand+Hotel&display=swap" rel="stylesheet">
<style>

body{ 
background: url('../images/suje.jpg') no-repeat 50% 50% fixed; 
-webkit-background-size: cover; 
-moz-background-size: cover; 
-o-background-size: cover; 
background-size: cover; 
}


#contents{
width: 1400px;
margin: 0 auto;

}
#dImg{
width: 430px;
height: 380px;
padding-bottom: 1%;
}
#applyList{
margin: 2px 0;
}


#MOVE_TOP{
  	text-decoration: none;
    position: fixed;
    right: 2%;
    bottom: 30px;
    display: none;
    color: white; 
    font-size:30px;  
 
}
#applyBox{
	display: none;
}
#editBox{
	display: none;
}#listOff{
	display: none;
}#onSearch{
 color: darkslategray;
}

#onSearch:hover{
	text-decoration: underline;
	
}#applyListBox{
display: none;
}
.border{
	
	width: 1350px;
	height: 200px;
	overflow: auto;
	
	
	
}textarea {
	width: 400px;
	height:200px;
}
.item{
float:left;
width: 450px;
height:680px;
background-color: white;


/* border: 1px solid #ddd; */
}
.searchItem{
color:white;
width: 450px;
height:680px;
/* border: 1px solid #ddd; */
}

.itemIn{

width: 430px;
height: 660px;
margin: 0 auto;

}.searchItemIn{
width: 430px;
height: 660px;
margin: 0 auto;


}
 .applyItem{
border-bottom: 1px solid #ddd;
background-color: white;
padding-left: 10px;
}
.dogChar{
height:40px;
width: 430px;
overflow: auto;
}
.whiteColor{
	color : white;
}.backColor{
	background-color: white;
}
#test{
height: 100px;
background-color: #black;
width: 1810;
}
#mainTitle{
 text-align: center;
 font-family: 'Grand Hotel', cursive;
 font-size: 7em;
 color:white;
}#cansleEdit{
margin-left: 35%;

}
#cansleApply{
margin-left: 35%;

}
#keyword{
	display: inline;
	width: 1075px;
}#stype{
	display: inline;
	width: 200px;
}

#searchBox{
 margin-bottom: 2%;
}

</style>
</head>
<body>
<div id="test">
	<%@include file="../frame/nav.jsp"%>
</div>

<!-- <div class="main" style="background-image: url('images/backgroud.jpg')">
<div class="cover black" data-color="white"></div> -->

<!-- 컨텐츠시작 -->

<div id="contents">
<h1  id="mainTitle">Adopt Dog</h1>
<div id="applyBox">
<button onclick="cansleApply()" class="btn btn-default whiteColor" id="cansleApply">x</button>
<h2 class="whiteColor">입양 신청</h2>
<form id="apply">
  <table>
       <tr>
          <td class="whiteColor">유기번호</td><td><input   type="text" id="a_desertionNo" name="a_desertionNo" readonly="readonly" ></td>
      </tr>
      <tr>
          <td class="whiteColor">아이디 </td><td><input   type="text" id="m_id" name="m_id" required="required" readonly="readonly"  value="<%=session.getAttribute("id") %>" ></td>
      </tr>
       <tr>
          <td class="whiteColor">신청제목</td><td><input   type="text" id="a_title" name="a_title" required="required"></td>
       </tr>
        <tr>
          <td class="whiteColor">신청내용</td><td><textarea  id="a_text" name="a_text" required="required" placeholder="140자 내로 작성해주세요"></textarea></td>
       </tr>
      <tr><td><input type="submit" value="신청" class="btn btn-default whiteColor"></td></tr>
  </table>
</form>
</div>

<div id="editBox">
<h2 class="">신청 수정</h2>
<button onclick="cansleEdit()" class="btn btn-default whiteColor" id="cansleEdit">x</button>
<form id="edit">
  <table>
  	<tr>
          <td class="whiteColor">게시글번호</td><td><input   type="text" id="e_idx" name="a_idx" readonly="readonly"></td>
      </tr>
       <tr>
          <td class="whiteColor">유기번호</td><td><input   type="text" id="e_desertionNo" name="a_desertionNo" readonly="readonly"></td>
      </tr>
      <tr>
          <td class="whiteColor">아이디 </td><td><input  type="text" id="e_id" name="m_id" readonly="readonly"></td>
      </tr>
       <tr>
          <td class="whiteColor">신청제목</td><td><input   type="text" id="e_title" name="a_title" required="required"></td>
       </tr>
        <tr>
          <td class="whiteColor">신청내용</td><td><textarea   id="e_text" name="a_text" required="required"></textarea></td>
       </tr>
      <tr><td><input type="submit" value="수정" class="btn btn-default whiteColor"></td></tr>
  </table>
</form>
</div>

	
	<div><button class="btn btn-default whiteColor " id="listOn" onclick="showList()" >신청목록</button><button class="btn btn-default whiteColor" id="listOff" onclick="cansleApplyList()">목록닫기</button></div>
	<div id="applyListBox">
	<div class="searchBox">
	
		<form id="searchList">
			<h2 id="sTitle" class="whiteColor">신청목록검색</h2>
			<select  class="form-control" name="stype" id="stype">
				<option value="sboth">아이디+유기번호</option>
				<option value="sid">아이디</option>
				<option value="snumber">유기번호</option>
			</select>
			<input type="text"  name="keyword" id="keyword"  class="form-control" > <input type="submit"  value="검색"  class="btn btn-default whiteColor">
		</form>
	</div>	
	<div id="applyList">
	
	</div>
	</div>
	<div id="apiSearch"></div>
	
	<div id='list'><h2  class="whiteColor">유기견 현황</h2></div>
	<a id="MOVE_TOP" href="#">TOP</a>
	
	<%-- <%      
	
			int loginChk=0;
			if(session.getAttribute("m_Id")!=null){
				loginChk=1;
			}
	%> --%>
	
</div>
<!-- 
</div>
	
</div>	 -->


<!-- 컨텐츠끝 -->
		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script>


 $(document).ready(function() {
		var count=1;
		list(count);
		
	//무한스크롤 이벤트	
	 $(function(){
	        $(window).scroll(function(){
	            let $window = $(this);
	            let scrollTop = $window.scrollTop();
	            let windowHeight = $window.height();
	            let documentHeight = $(document).height();
	            
	            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	            
	            
	            if( scrollTop + windowHeight + 50 > documentHeight ){
	            	count++;
	                list(count);
	            }
	        })
	       
	    })
});
	
	/* 스크롤 top 이벤트 */
	$(window).scroll(function (){
		if($(this).scrollTop()>500){
			$('#MOVE_TOP').fadeIn();
		}else{
			$('#MOVE_TOP').fadeOut();
		}
	});	
	$('#MOVE_TOP').click(function() {
		$('html,body').animate({
			scrollTop :0
		},500);
		return false;
	});
		
 
	//api 뽑아오기
	    
function list(count) {

		$.ajax({
					//url : 'dogList',
					url : 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20190430&pageNo='+count+'&numOfRows=7&upkind=417000&ServiceKey=w6tghMtfkPZl5OXy9wZ9CkT5WTgS0LAnwimWMdM2Bdqma5ru5Zf6vRLWPxELbS6A%2FZEU4mr333w4PAaHsdixGQ%3D%3D',
					type : 'GET',
					dataType : 'xml',

					error : function(error) {
						alert(error);
					},
					success : function(data) {
						var html='';
						console.log(data);
						$.each($(data).find('item'), function(idx, val) {
							console.log(val);
							var dNO=$(val).find('desertionNo').text();
						
							
							
							html+='<div class="item">';
							html+='<div class="itemIn">';
					  		html+='<div>유기번호 : '+$(val).find('desertionNo').text()+'</div>';
							html+='<br>';
							html+='<div>견종 : '+$(val).find('kindCd').text()+'</div>';
							html+='<div>성별 : '+$(val).find('sexCd').text()+'</div>';
							html+='<div>나이 : '+$(val).find('age').text()+'</div>';
							html+='<div>체중 : '+$(val).find('weight').text()+'</div>';
							html+='<div>담당자 : '+$(val).find('chargeNm').text()+'</div>';
							html+='<div>담당자 연락쳐 : '+$(val).find('officetel').text()+'</div>';
							html+='<div>상태 : '+$(val).find('processState').text()+'</div>';
							html+='<div class="dogChar">특징 : '+$(val).find('specialMark').text()+'</div>';
							html+='<br>';
							html+='<img class="img-rounded" id="dImg" src="'+$(val).find('popfile').text()+'">';
							html +='<div><button class="btn btn-default" onclick="insert('+dNO+')">입양신청</button></div><br>\n';
							html+='</div>';
							html+='</div>';
						     
						
						});
						$('#list').append(html);
					}

			});
	}

	
	//신청하기 누를시 신청폼에 값을 바인딩해주고 입양이 진행중인지 확인해주는 함수
function insert(dNO){
	$.ajax({
		url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest/chk?dno='+dNO,
        type : 'GET',
        dataType : 'text',
        error : function(error){
            
            alert(error);
            
        },
        success : function(data){
        	if(data=='success'){
        	$('#applyBox').css('display','block');
            $('#a_desertionNo').val(dNO);
            $('html,body').animate({
    			scrollTop :0
    		},400);  
            
        }else{
        	alert('이미 분양이 진행중입니다.');
        }
      }          
        
   });
	return false;
	
}	
	


//취소
function cansleApply() {
	$('#applyBox').css('display','none');
}
function cansleEdit() {
	$('#editBox').css('display','none');
}
function cansleApplyList() {
	$('#applyListBox').css('display','none');
	$('#listOff').css('display','none');
	$('#listOn').css('display','block');
}function cansleSearch() {
	$('#apiSearch').css('display','none');
}
	
/* 	function applyChk(dNO) {
		
		
		 $.ajax({
            url : 'http://localhost:8080/abandonedDog/rest/chk?dno='+dNO,
            type : 'GET',
            error : function(error){
                
                alert(error);
                
            },
            success : function(data){
            	$('#apply').css('display','block');
                $('#a_desertionNo').val(dNO);
                $('html,body').animate({
        			scrollTop :0
        		},400);            
            
                }          
            
        });
		return false;
		
	} */
	
	
	
	
	//insert
	$('#apply').submit(function(){
                 
		if(cutText($('#a_text').val())==1){
			alert('140자 내로 작성해주세요');
			return false;
			}
		
               $.ajax({
                url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest',
                type : 'POST',
                data :$('#apply').serialize(),
                dataType: 'text',
                error : function(error){
                    alert(error);
                },success : function(data){
              
                    //alert(data);
                    if(data=='success'){
                        alert('신청이 완료되었습니다');
                        cansleApply();
                        showList();
                    } 
                }
            });
            
            this.reset();
            return false;
        });
	//list
function showList() {
		$('#applyListBox').css('display','block');
		$('#applyList').addClass('border');
		$('#listOff').css('display','inline');
		$('#listOn').css('display','none');
		$.ajax({
			url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest',
			type: 'GET',
			error : function(error) {
				alert(error);
			},success : function(data){
				   var html = '';
				  
	                for(var i=0; i<data.length;i++){
	                	
	                    html += '<div class="applyItem">\n';
	                    
	                    html += '유기번호 : <a title="조회" id="onSearch" onclick="apiSearch('+data[i].a_desertionNo+')">' + data[i].a_desertionNo  +'</a>\n';
	                    html += '아이디 : '  + data[i].m_id  +'\n';
	         	        //html += '신청날짜 : ' + data[i].a_date+'\n';
	         	        html += '신청날짜 : ' + changeDate(data[i].a_date)+'\n';
	                    html += '신청제목 : ' + data[i].a_title +'\n';
	                    html += '신청내용 : ' + data[i].a_text +'<br>\n';
	                    html += '<button class="btn btn-default btn-xs" onclick="edit('+ data[i].a_idx +')">수정하기</button>\n';
	                    html += '<button class="btn btn-default btn-xs" onclick="del('+ data[i].a_idx +')">삭제하기</button>\n';
	              	    html += '</div>\n';
	                }
	                
	                $('#applyList').html(html);
			}
			
		});
		
	}
	
	

	//날짜 자르기용
	function changeDate(secDate) {
		var date = secDate.substr(0,16);
		return date;
	}
	
	//delete
	function del(idx) {
		 if(confirm('입양 안 하시게여?...인성..?')){
		           $.ajax({
	                url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest/'+idx+'?id='+'<%=session.getAttribute("id")%>',
	                type : 'DELETE',
	                dataType:'text',
	                success : function(data){
	                    
	                    if(data=='success'){
	                        alert('삭제되었습니다');
	                        showList();
	                      
	                    }else{
	                    	 alert('다른 사람껀데..인성..?');
		                      showList();
	                    	
	                    }       
	                }
	            });
	           
	        }
		 
	}
	
	//edit
	function edit(idx) {
		 $('#editBox').css('display','block');
		 $.ajax({
             url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest/'+idx,
             type : 'GET',
             error : function(error){
                 
                 alert(error);
                 
             },
             success : function(data){
                
                $('#e_idx').val(data.a_idx);
                $('#e_desertionNo').val(data.a_desertionNo);
                $('#e_id').val('<%=session.getAttribute("id")%>');
                $('#e_title').val(data.a_title);
                $('#e_text').val(data.a_text);
       
             
                 }          
             
         });
		
	}
	   
	$('#edit').submit(function(){
		if(confirm('수정하시겠습니까?')){ 
			if(cutText($('#e_text').val())==1){
				alert('140자 내로 작성해주세요');
				return false;
			}
			
		   $.ajax({
                      url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest',
                      type : 'Put',
                      contentType : 'application/json; charset=utf-8',
                      dataType : 'text',
                      data : JSON.stringify({
                    	  a_idx : $('#e_idx').val(),
                    	  a_desertionNo : $('#e_desertionNo').val(),
                    	  m_id : $('#e_id').val(),
                          a_title : $('#e_title').val(),
                          a_text : $('#e_text').val()
                      }), error : function(error){
                          alert(error);
                      }, success : function(data){
                          if(data=='success'){
                          alert('수정완료');
                           showList();
                          } else{
                        	  
                        	 alert('거 본인꺼나 다시 확인해주세요');
                          }
                      }
                  });
			 this.reset();
		 cansleEdit();
		}
	return false
		   
    });
   
//api검색
function apiSearch(dno) {
	
	alert(dno+' 를 가져옵니다!');
	
		$.ajax({
			//url : 'dogList',
			url : 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=20140301&endde=20190430&pageNo=1&numOfRows=80&upkind=417000&ServiceKey=w6tghMtfkPZl5OXy9wZ9CkT5WTgS0LAnwimWMdM2Bdqma5ru5Zf6vRLWPxELbS6A%2FZEU4mr333w4PAaHsdixGQ%3D%3D',
			type : 'GET',
			dataType : 'xml',

			error : function(error) {
				alert(error);
			},
			success : function(data) {
				
				var html='';
				console.log(data);
				$.each($(data).find('item'), function(idx, val) {
					
				if($(val).find('desertionNo').text()==dno){
					alert('왔어..!!왔어!!!');
					html+='<br>';
					html+='<h3 class="whiteColor">신청된 유기견 정보</h3>';
					html+='<br>';
					html+='<div class="searchItem">';
					html+='<div class="searchItemIn">';
					html+='<div>유기번호:'+$(val).find('desertionNo').text()+'</div>';
					html+='<div>견종:'+$(val).find('kindCd').text()+'</div>';
					html+='<div>성별:'+$(val).find('sexCd').text()+'</div>';
					html+='<div>나이:'+$(val).find('age').text()+'</div>';
					html+='<div>체중:'+$(val).find('weight').text()+'</div>';
					html+='<div>담당자:'+$(val).find('chargeNm').text()+'</div>';
					html+='<div>담당자 연락쳐:'+$(val).find('officetel').text()+'</div>';
					html+='<div>상태:'+$(val).find('processState').text()+'</div>';
					html+='<div class="dogChar">특징:'+$(val).find('specialMark').text()+'</div>';
					html+='<img class="img-rounded" id="dImg" src="'+$(val).find('popfile').text()+'">';
					html+='<div><button class="btn btn-default whiteColor" onclick="cansleSearch()">닫기</button></div>';
					html+='</div>';
					html+='</div>';
					
				}    
				
			});
			
			
			$('#apiSearch').html(html);
			$('#apiSearch').css('display','block');
			}

		});
		
	 
}

 

 //searchlist
$('#searchList').submit(function () {
		
		$.ajax({
			url : 'http://ec2-54-180-95-162.ap-northeast-2.compute.amazonaws.com:8080/adoptDog/rest/searchList?stype='+$('#stype').val()+'&keyword='+$('#keyword').val(),
			type: 'GET',
			error : function(error) {
				alert(error);
			},success : function(data){
				   var html = '';
				
				   if(data.length==0){
				   
					alert('검색결과가 없습니다');
					 this.reset();
					return false;
					   
				   }
				    
				  
	                for(var i=0; i<data.length;i++){
	                	
	                    html += '<div  class="applyItem">\n';
	                    
	                    html += '유기번호 : <a id="onSearch" onclick="apiSearch('+data[i].a_desertionNo+')">' + data[i].a_desertionNo  +'</a>\n';
	                    html += '아이디 : '  + data[i].m_id  +'\n';
	         	   	    html += '신청날짜 : ' + changeDate(data[i].a_date)+'\n';
	                    html += '신청제목 : ' + data[i].a_title +'\n';
	                    html += '신청내용 : ' + data[i].a_text +'<br>\n';
	                    html += '<button class="btn btn-default btn-xs" onclick="edit('+ data[i].a_idx +')">수정하기</button>\n';
	                    html += '<button class="btn btn-default btn-xs" onclick="del('+ data[i].a_idx +')">삭제하기</button>\n';
	              	    html += '</div>\n';
	                }
	                
	                $('#applyList').html(html);
			}
			
		});
		 this.reset();
		 return false;
		
}); 
 
 //140자로 자르기
 function cutText(data) {
	// alert(data.length);
	 
	 if(data.length>140){
		 return 1;
	 }
	
}
	

</script>
</html>