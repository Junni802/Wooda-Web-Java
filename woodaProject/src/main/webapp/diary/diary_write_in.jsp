<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_inc/inc_head.jsp" %>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.diaryIn{
	background-color: var(--color-black);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
</style>
<div class="diaryIn">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
<script>
var lacation = "";
var car
var popupWidth = 1000;
var popupHeight = 700;

var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

function showPopup1()
{ 
	window.name = 1;
	openWin = window.open('diary/kakaoMap.jsp', 'childForm', 'status=no, height=700, width=1000, left='+ popupX + ', top='+ popupY);
}

function showPopup2()
{ 
	window.name = 2;
	openWin = window.open('diary/kakaoMap.jsp', 'childForm', 'status=no, height=700, width=1000, left='+ popupX + ', top='+ popupY);
}

function showPopup3()
{ 
	window.name = 3;
	openWin = window.open('diary/kakaoMap.jsp', 'childForm', 'status=no, height=700, width=1000, left='+ popupX + ', top='+ popupY);
}
$(function() {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		//buttonImage: "/images/kr/create/btn_calendar.gif",
		buttonImageOnly: true,
		// showOn :"both",
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		duration:200,
		showAnim:'show',
		showMonthAfterYear: false
		// yearSuffix: '년'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$( "#sdate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#eday" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#edate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#sday" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});

var count = 1;
function pclick(num){
	if(count < 4) {
		if(count > 1) {
			if($("#bs_place1").val() !== "" && count === 2) {
				$( '#trival' ).before( '<input type="button" class="name' + count + '" name="name' + count + '" value="여행코스' + count + '" id="name' + count + '" onclick="showPopup2();" />' );
				$( '#trival' ).before( '<span class="name' + count + '">&nbsp;&nbsp;&nbsp;</span>' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_place' + count + '" id="bs_place' + count + '"  />' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lat' + count + '"  id="bs_lat' + count + '"  />' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lng' + count + '"  id="bs_lng' + count + '"  />' );
				count++;	
			}else if($("#bs_place2").val() !== "" && count === 3){
				$( '#trival' ).before( '<input type="button" class="name' + count + '" name="name' + count + '" value="여행코스' + count + '" id="name' + count + '" onclick="showPopup3();" />' );
				$( '#trival' ).before( '<span class="name' + count + '">&nbsp;&nbsp;&nbsp;</span>' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_place' + count + '" id="bs_place' + count + '"  />' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lat' + count + '"  id="bs_lat' + count + '"  />' );
				$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lng' + count + '"  id="bs_lng' + count + '"  />' );
				count++;	
			}
		}else{
			$( '#trival' ).before( '<input type="button" class="name' + count + '" name="name' + count + '" value="여행코스' + count + '" id="name' + count + '" onclick="showPopup1();" />' );
			$( '#trival' ).before( '<span class="name' + count + '">&nbsp;&nbsp;&nbsp;</span>' );
			$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_place' + count + '" id="bs_place' + count + '"  />' );
			$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lat' + count + '"  id="bs_lat' + count + '"  />' );
			$( '#trival' ).append( '<input type="hidden" class="name' + count + '" name="bs_lng' + count + '"  id="bs_lng' + count + '"  />' );
			count++;
		}
	}
}

function mclick(num){
	if(count >= 0){
		if(count == 2){
			$('.name1').remove();
			count--;
		}else if(count == 3){
			$('.name2').remove();
			count--;
		}else if(count == 4){
			$('.name3').remove();
			count--;
		}
	}
}

var title = false;
const calender = /(^\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;

// 사용자 작성시 제약사항 함수
function test(){
	if(count > 1 && $("#bs_place1").val() !== ""){
		if(calender.test($("#sdate").val()) && calender.test($("#edate").val())){
			if($("#title").val().length >= 6){
				return true;
			}else{
				alert("제목은 6글자 이상 입력하세여 합니다.");
				return false;
			}
		}else{
			alert("여행 기간을 정확히 입력바랍니다.");
			return false;
		}
	}else{
		alert("여행코스는 1개이상 입력하셔야 합니다.");
		return false;
	}
}

</script>
<style>
.diaryinform {
    background-color: var(--color-black);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
textarea {
	width:1000px; height=50px;
}

</style>
</head>
<body>
<form name="frm" action="write_proc_in" method="post" onsubmit="return test()" >
<table width="1000px" border="1">
<tr>
<th width=40px">제목  </th>
<td> <input type="text" minlength="4" name="bs_title" id="title" value="" placeholder="제목을 입력하세여" style="width:*;"/> </td>
</tr>
<tr>
<th>여행 기간  </th>
<td >
<input type="text" name="bs_start" id="sdate" value="" size="10" class="ipt" /> ~
<input type="text" name="bs_end" id="edate" value="" size="10" class="ipt" />
</td>
</tr>
<tr>
<th> 여행 코스  </th>
<td> <span id="trival"></span>
<input type="button" name="plus_click" id="plusb" onclick="pclick(this);" value="여행지 추가" />
<input type="button" name="minus_click" id="minusb" onclick="mclick(this);" value="여행지 제거" /></td>
</tr>
<tr cellpadding="1px">
<th>여행 지역 </th>
<td>
<input type="radio" name="bs_area" value="a" checked="checked" />서울&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="b"  />경기&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="c"  />인천&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="d"  />대구&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="e"  />충청북도&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="f"  />충청남도&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="g"  />전라북도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="h"  />전라남도&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="i"  />강원도&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="j"  />광주&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="k"  />대전&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="l"  />울산&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="m"  />부산&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="n"  />제주도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="o"  />경상북도&nbsp;&nbsp;&nbsp;
<input type="radio" name="bs_area" value="p"  />경상남도&nbsp;&nbsp;&nbsp;
</td>
</tr>
<tr>
<th>성별 </th>
<td> <input type="radio" name="bs_gender" value="m" id="man" checked="checked" >남자
<input type="radio" name="bs_gender" value="w" id="woman">여자</td>
</tr>
<tr>
<th>재방문 의사 </th>
<td> <input type="radio" name="bs_visit" value="y" checked="checked" >재방문 의사 있음
<input type="radio" name="bs_visit" value="n">재방문 의사 없음</td>
</tr>
<tr>
<td colspan="2"/>
<input type="file" name="bs_img1" onchange="readURL1(this);" >
<input type="file" name="bs_img2" onchange="readURL2(this);" >
<input type="file" name="bs_img3" onchange="readURL3(this);" >
<input type="file" name="bs_img4" onchange="readURL4(this);" >
<input type="file" name="bs_img5" onchange="readURL5(this);" >
<br />
</tr>
<tr >
<td colspan="2">
<textarea minlength="4" rows="35px" name="bs_content" ></textarea>
</td>
</tr>
</table>
<p align="right">
전체공개&nbsp;&nbsp;
<input type="radio" name="bs_astatus" value="y"  >공개
<input type="radio" name="bs_astatus" value="n" checked="checked" >비공개
</p>
<p align="right">
연인공개&nbsp;&nbsp;
<input type="radio" name="bs_cstatus" value="y"  >공개
<input type="radio" name="bs_cstatus" value="n" checked="checked" >비공개
</p>
<p align="center" >
<input type="submit" value="제출" style="width:100px; height:30px;"/>
<input type="reset" value="다시입력" style="width:100px; height:30px;" /> 
</p>
</form>
</div>
</body>
</html>