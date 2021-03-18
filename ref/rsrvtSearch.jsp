<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="_IMG" value="/template/common/images"/>

<c:import url="/template/top.do" charEncoding="utf-8">
	<c:param name="title" value="예계약현황 조회"/>
</c:import>
<script>

	$(function(){
		changeCheckbox();
		removeItem();

		$('#searchBgnDe').val(getSearchDt($('#searchBgnDe').val()));
		$('#searchEndDe').val(getSearchDt($('#searchEndDe').val()));
	});
	
	function changeCheckbox(){
		$('input[type=checkbox][data-value]').off();
		$('input[type=checkbox][data-value]').change(function(){
			var dataValue = $(this).attr('data-value');
			var addDiv = $('.stats-inner-list[data-value="' + dataValue + '"]');
			if($(this).is(':checked')){
				addDiv.addClass("on");
				addItem(dataValue);
			}else{
				frmoveChildItem(dataValue);
			}
		});
		
		$('input[type="text"]').keydown(function(event) {
				if (event.keyCode == 13) {
				return false;
				};
		});
	}
	
	function frmoveChildItem(dataValue){
		switch (dataValue) {
			case '담당구분':
				frmoveChildItem('담당구분_월');
				frmoveChildItem('담당구분_담당팀');
				frmoveChildItem('담당구분_담당자');
				break;
			case '통계활용구분':
				frmoveChildItem('통계활용구분_사업별구분');
				frmoveChildItem('통계활용구분_프로그램구분');
				frmoveChildItem('통계활용구분_프로그램유형');
				frmoveChildItem('통계활용구분_개인단체구분');
				frmoveChildItem('통계활용구분_인원유형(대분류)');
				frmoveChildItem('통계활용구분_인증프로그램유형');
				break;
			case '정산서기준인원':
				frmoveChildItem('정산서기준인원_순인원');
				frmoveChildItem('정산서기준인원_연인원');
				break;
			case '성별':
				frmoveChildItem('성별_남');
				frmoveChildItem('성별_여');
				break;
			case '연령구분':
				frmoveChildItem('연령구분_미취학');
				frmoveChildItem('연령구분_10대');
				frmoveChildItem('연령구분_20대');
				frmoveChildItem('연령구분_30대');
				frmoveChildItem('연령구분_40대');
				frmoveChildItem('연령구분_50대');
				frmoveChildItem('연령구분_60대이상');
				break;
			case '통계활용구분_인원유형(대분류)':
				<c:forEach var="item" items="${nofprClsList}">
				frmoveChildItem('${item.codeIdx}');
				</c:forEach>
				break;
		}
		var addDiv = $('.stats-inner-list[data-value="' + dataValue + '"]');
		addDiv.removeClass("on");
		var titleTag = addDiv.find('.stats-inner-title');
		addDiv.empty();
		addDiv.append(titleTag);
	}
	
	function removeItem(){
		$('.delete-btn').click(function (){
			
			// add div tag 추출
			var parentTag = $(this).parent().parent();
			
			// tag 삭제 처리
			$(this).parent().remove();
			
			// 검색 상세를 전부 삭제했을경우 하위 필터 hide
			if(parentTag.find('.stats-check').length == 0){
				
				// on 클래스 삭제
				parentTag.removeClass("on");
				
				// 제목만 남기고 하위 내용 전부 삭제
				var titleTag = parentTag.find('.stats-inner-title');
				parentTag.empty();
				parentTag.append(titleTag);
				
				// 상위분류 체크박스 false 처리
				console.log(parentTag.attr('data-value'))
				var checkedBox = $('input[type=checkbox][data-value='+parentTag.attr('data-value')+']');
				checkedBox.prop('checked',false);
				
			}
		});
	}
	
	function createItem(dataValue){
		var html = ""
		
		var flag = false;
		var optionTag = "";
		var inputPlaceholder = "";
		var addClass = "";
		var inputAddClass = "";
		var onchangeFn = "";
		var inputName = "";
		
		switch (dataValue) {
			case "입실일":case "퇴실일":case "숙박일수":
			case "정산서기준인원_순인원":case "정산서기준인원_연인원":
			case "성별_남":case "성별_여":
			case "연령구분_미취학":
			case "연령구분_10대":case "연령구분_20대":case "연령구분_30대":
			case "연령구분_40대":case "연령구분_50대":case "연령구분_60대이상":
 			case "매출액_숙박비용":case "매출액_시설이용료":case "매출액_프로그램비":
			case "매출액_식사비용":case "매출액_기타":case "매출액_합계":
				flag = true;
				optionTag = "${nCndtnOpt}";
				addClass = "stats-check2"
				var str = dataValue.split("_");
				if(dataValue == "입실일" || dataValue == "퇴실일"){
					inputPlaceholder = ((str.length > 1) ? str[str.length-1] : dataValue) + " 입력"
					inputAddClass = "dateFormat";
				}else{
					onchange = 'onchange="fnNumCheck(this)';
					inputPlaceholder = ((str.length > 1) ? str[str.length-1] : dataValue) + " 입력"
				}
				switch (dataValue) {
					case "입실일":
						inputName = "searchEthrmDtValList";
						selectName = "searchEthrmDtCndList";
						break;
					case "퇴실일":
						inputName = "searchLthrmDtValList";
						selectName = "searchLthrmDtCndList";
						break;
					case "숙박일수":
						inputName = "searchStngCntValList";
						selectName = "searchStngCntCndList";
						break;
					case "정산서기준인원_순인원":
						inputName = "searchNetNofprCntValList";
						selectName = "searchNetNofprCntCndList";
						break;
					case "정산서기준인원_연인원":
						inputName = "searchManDayNofprCntValList";
						selectName = "searchManDayNofprCntCndList";
						break;
					case "성별_남":
						inputName = "searchSexMCntValList";
						selectName = "searchSexMCntCndList";
						break;
					case "성별_여":
						inputName = "searchSexFCntValList";
						selectName = "searchSexFCntCndList";
						break;
					case "연령구분_미취학":
						inputName = "searchNofpr0CntValList";
						selectName = "searchNofpr0CntCndList";
						break;
					case "연령구분_10대":
						inputName = "searchNofpr10CntValList";
						selectName = "searchNofpr10CntCndList";
						break;
					case "연령구분_20대":
						inputName = "searchNofpr20CntValList";
						selectName = "searchNofpr20CntCndList";
						break;
					case "연령구분_30대":
						inputName = "searchNofpr30CntValList";
						selectName = "searchNofpr30CntCndList";
						break;
					case "연령구분_40대":
						inputName = "searchNofpr40CntValList";
						selectName = "searchNofpr40CntCndList";
						break;
					case "연령구분_50대":
						inputName = "searchNofpr50CntValList";
						selectName = "searchNofpr50CntCndList";
						break;
					case "연령구분_60대이상":
						inputName = "searchNofpr60CntValList";
						selectName = "searchNofpr60CntCndList";
						break;
					case "매출액_숙박비용":
						inputName = "searchStngChargeValList";
						selectName = "searchStngChargeCndList";
						break;
					case "매출액_시설이용료":
						inputName = "searchFaciChargeValList";
						selectName = "searchFaciChargeCndList";
						break;
					case "매출액_프로그램비":
						inputName = "searchPcdChargeValList";
						selectName = "searchPcdChargeCndList";
						break;
					case "매출액_식사비용":
						inputName = "searchMealChargeValList";
						selectName = "searchMealChargeCndList";
						break;
					case "매출액_기타":
						inputName = "searchEtcChargeValList";
						selectName = "searchEtcChargeCndList";
						break;
					case "매출액_합계":
						inputName = "searchPrslsValList";
						selectName = "searchPrslsCndList";
						break;
				}
				break;
			case "담당구분_담당팀":case "담당구분_담당자":case "단체명":
				flag = true;
				addClass = "stats-check2";
				optionTag = "${tCndtnOpt}";
				var str = dataValue.split("/");
				inputPlaceholder = ((str.length > 1) ? str[str.length-1] : dataValue) + " 입력"
				
				switch (dataValue) {
					case "담당구분_담당팀":
						inputName = "searchTeamNmValList";
						selectName = "searchTeamNmCndList";
						break;
					case "담당구분_담당자":
						inputName = "searchPinchNmValList";
						selectName = "searchPinchNmCndList";
						break;
					case "단체명":
						inputName = "searchGrpNmValList";
						selectName = "searchGrpNmCndList";
						break;
					}
				break;
			case "담당구분":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="200" name="" data-value="담당구분_월"><label for="200">월</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="201" name="" data-value="담당구분_담당팀"><label for="201">담당팀</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="202" name="" data-value="담당구분_담당자"><label for="202">담당자</label></div>'
				break;
			case "통계활용구분":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="203" name="" data-value="통계활용구분_사업별구분"><label for="203">사업별구분</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="204" name="" data-value="통계활용구분_프로그램구분"><label for="204">프로그램구분</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="205" name="" data-value="통계활용구분_프로그램유형"><label for="205">프로그램유형</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="206" name="" data-value="통계활용구분_개인단체구분"><label for="206">개인/단체구분</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="207" name="" data-value="통계활용구분_인원유형(대분류)"><label for="207">인원유형(대분류)</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="208" name="" data-value="통계활용구분_인증프로그램유형"><label for="208">인증프로그램유형</label></div>'
				break;
			case "정산서기준인원":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="209" name="" data-value="정산서기준인원_순인원"><label for="209">순인원</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="210" name="" data-value="정산서기준인원_연인원"><label for="210">연인원</label></div>'
				break;
			case "사업구분":
				html = '<c:forEach var="item" items="${bsnssList}"><div class="stats-check"><input type="checkbox" class="depth1" name="searchBsnssTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "개인단체":
				html = '<c:forEach var="item" items="${nofprList}"><div class="stats-check"><input type="checkbox" class="depth1" name="searchNofprTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>' 
				break;
			case "성별":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="M" name="searchSexList" data-value="성별_남"><label for="M">남</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="F" name="searchSexList" data-value="성별_여"><label for="F">여</label></div>'
				break;
			case "연령구분":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt00" name="searchNofprCntType" value="NofprCnt00" data-value="연령구분_미취학"><label for="NofprCnt00">미취학</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt10" name="searchNofprCntType" value="NofprCnt10" data-value="연령구분_10대"><label for="NofprCnt10">10대</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt20" name="searchNofprCntType" value="NofprCnt20" data-value="연령구분_20대"><label for="NofprCnt20">20대</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt30" name="searchNofprCntType" value="NofprCnt30" data-value="연령구분_30대"><label for="NofprCnt30">30대</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt40" name="searchNofprCntType" value="NofprCnt40" data-value="연령구분_40대"><label for="NofprCnt40">40대</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt50" name="searchNofprCntType" value="NofprCnt50" data-value="연령구분_50대"><label for="NofprCnt50">50대</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="NofprCnt60" name="searchNofprCntType" value="NofprCnt60" data-value="연령구분_60대이상"><label for="NofprCnt60">60대이상</label></div>'
				break;
			case "매출액":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="211" name="" data-value="매출액_숙박비용"><label for="211">숙박비용</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="212" name="" data-value="매출액_시설이용료"><label for="212">시설이용료</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="213" name="" data-value="매출액_프로그램비"><label for="213">프로그램비</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="214" name="" data-value="매출액_식사비용"><label for="214">식사비용</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="215" name="" data-value="매출액_기타"><label for="215">기타</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="216" name="" data-value="매출액_합계"><label for="216">합계</label></div>'
				break;
			case "취소여부":
				html = '<div class="stats-check"><input type="checkbox" class="depth1" id="217" name="searchCancelTypeYnList" value="N" data-value="취소여부_운영"><label for="217">운영</label></div>'
							+'<div class="stats-check"><input type="checkbox" class="depth1" id="218" name="searchCancelTypeYnList" value="Y" data-value="취소여부_취소"><label for="218">취소</label></div>'
				break;
			case "담당구분_월":
				html = '<c:forEach var="mon" begin="1" end="12"><div class="stats-check"><input type="checkbox" class="depth2" name="searchMonthList" id="month_${mon }" value="<fmt:formatNumber value="${mon }" pattern="00"/>"><label for="month_${mon }"><c:out value="${mon}"/>월</label></div></c:forEach>'
				break;
			case "통계활용구분_사업별구분":
				html = '<c:forEach var="item" items="${bsnssList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchBsnssTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "통계활용구분_프로그램구분":
				html = '<c:forEach var="item" items="${pcdList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchPcdTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "통계활용구분_프로그램유형":
				html = '<c:forEach var="item" items="${remoteList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchRemoteTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "통계활용구분_개인단체구분":
				html = '<c:forEach var="item" items="${nofprList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchNofprTypeCdList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "통계활용구분_인원유형(대분류)":
				html = '<c:forEach var="item" items="${nofprClsList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchNofprLrclsCdList" id="${item.codeIdx}" value="${item.codeIdx}" data-value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			case "통계활용구분_인증프로그램유형":
				html = '<c:forEach var="item" items="${pcdCrtfcList}"><div class="stats-check"><input type="checkbox" class="depth2" name="searchPcdCrtfcYnList" id="${item.codeIdx}" value="${item.codeIdx}"><label for="${item.codeIdx}"><c:out value="${item.codeNm}"/></label></div></c:forEach>'
				break;
			default:
				break;
		}
		if(dataValue.indexOf('CD_') >= 0){
			html = chgNofprLrclsCd(dataValue);
			flag = false;
		}
		
		if(flag){
			html = ''
				+ '<div class="stats-check ' + addClass + '">'
				+ '	<input type="text" name="' + inputName + '" placeholder="' + inputPlaceholder + '" class="form-control ' + inputAddClass + '" ' + onchangeFn +' required="required" autocomplete="off">'
				+ '	<select class="form-control" name="' + selectName + '" required="required">'
				+ optionTag
				+ '	</select>'
				+ '	<button class="delete-btn"></button>'
				+ '</div>'	
		}
		
		return html;
	}
	
	function addItem(dataValue){
		var addDiv = $('.stats-inner-list[data-value="' + dataValue + '"]');
		addDiv.append(createItem(dataValue));
		
		removeItem();
		changeCheckbox();
		addDiv.find(".dateFormat").last().datepicker({ 
			dateFormat : 'yyyy-mm-dd',
			onShow : function (inst, aniCompleted){
				if(aniCompleted){
					var val = $(inst.$el).val();
					if(dateRegex(val)){
						this.selectDate(new Date(val));
					}
				}
			}
		});
	}
	
	function allCheck(obj, cls){
		$('.'+cls).prop('checked', $(obj).is(':checked'));
		$('.'+cls).each(function(index, item){
			var dataValue = $(item).attr('data-value');
			if(dataValue){
				var addDiv = $('.stats-inner-list[data-value="' + dataValue + '"]');
				if($(item).is(':checked')){
					addDiv.addClass("on");
					addItem(dataValue);
				}else{
					frmoveChildItem(dataValue);
				}
			}
		});
		if(!$(obj).is(':checked')){
			switch (cls) {
				case 'depth0':
					$('.depth1_chk').prop('checked', false);
					$('.depth2_chk').prop('checked', false);
					$('.depth3_chk').prop('checked', false);
					break;
				case 'depth1':
					$('.depth2_chk').prop('checked', false);
					$('.depth3_chk').prop('checked', false);
					break;
				case 'depth2':
					$('.depth3_chk').prop('checked', false);
					break;
			}
		}
	}
	
	function chgSearUnit(txt){
		if(txt){
			$('.unit').each(function(){
				var tit = $(this).attr('title');
				if(tit.indexOf(txt) >= 0){
					$(this).parent().css('display','block');
				}else{
					$(this).parent().css('display','none');
				}
			})
		} else {
			$('.unit').parent().css('display','block');
		}
	}
	
	function searchCheck(){
		var unitCnt = $('input:checkbox[name=searchUnitCdList]:checked').length;
		if(unitCnt == 0){
			alert('한개 이상의 기관을 선택해주세요.');
		}else{
			var url = "<c:url value='/rsrvt/view.do'/>?"+$('#search').serialize();
			window.open(url, '_blank');
		}
		return false;
	}
	

	function chgNofprLrclsCd(dataValue){
		var html ='';
			$.ajax({
				url : '/code/ajaxLowCodeSelect.do',
				type : "post",
				data : {'upperCodeIdx':dataValue},
				dataType : "json",
				async: false,
				success : function(data){
					for (var i = 0; i < data.length; i++) {
						html += ''
						+ '<div class="stats-check">\n'
						+ '	<input type="checkbox" class="depth3" name="searchNofprSmclsCdList" id="' + data[i].idx + '" value="' + data[i].idx + '">\n'
						+ '	<label for="' + data[i].idx + '">\n'
						+ '		'+ data[i].cn +'\n'
						+ '	</label>\n'
						+ '</div>\n'
					}
				}, error : function(){
					alert('시스템 오류가 발생하였습니다.');
				}
			});
			return html;
	}
	
	function fnShow(){
		modalOpen(0, '');
		document.excel.reset();
		$('.modal-dialog').css('width', '700px');
	}

	function modal_close(){
		removeModal();
	}
	
	function fn_Insert() {
		if(!$('#excelFile').val()){
			alert('엑설 파일을 업로드 해주시기 바랍니다.');
			return;
		}
	  if(confirm("저장하시겠습니까?")){
		  document.excel.submit();
	  }
	}
</script>

<div class="modal fade" id="modal0" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 id="modalTitle0" class="modal-title">
					예계약 현황 엑셀 업로드
				</h5>
				<a type="button" class="modal-header close" data-dismiss="modal" aria-label="Close">
					Close <span aria-hidden="true">&times;</span>
				</a>
			</div>
			<div class="modal-body modalModel-body">
				<form name="excel" id="excel" method="post" action="/rsrvt/uploadExcel.do" enctype="multipart/form-data" >
					<fieldset>
						<legend class="hdn">엑셀 업로드 폼</legend>
						<table class="chart2">
							<colgroup>
								<col width="150px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th><label>업로드 파일</label></th>
									<td>
										<input type="file" name="excelFile" id="excelFile" class="form-control" onchange="fileCheck(this);" style="height: auto;"/> 
									</td>
								</tr>
								<tr>
									<th><label>양식 다운로드</label></th>
									<td>
										<a title="입력 엑셀 다운로드" style="display: block;margin-bottom: 5px" href="<c:url value="/template/excelFile/Reservation_contract_details.xlsx"/>">
											<img src="<c:url value="${_IMG}/btn/xls.gif"/>" style="margin-right: 5px;" alt="엑셀">Reservation contract details.xlsx
										</a>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div style="margin: 0;padding: 0;float: right;margin-top: 10px;">
							<button type="button" class="boot_btn boot_btn-primary" onclick="fn_Insert();">
								저장
							</button>
							<button type="button" class="boot_btn boot_btn-default" data-dismiss="modal" aria-label="Close">
								취소
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 09.17 수정 -->
<!-- 예계약현황 -->
<!-- erp/forPositionRegistExcel.do	-->
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>예계약현황 조회</h2>
				<ul class="nav navbar-right panel_titlebox">
					<li><a class="collapse-link" href="<c:url value="/front.do"/>">HOME</a></li>
					<li><div>&#62;</div></li>
					<li><a class="collapse-link" href="<c:url value="/rsrvt/search.do"/>">예계약현황 조회</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="row">
				<form name="search" id="search" onsubmit="return searchCheck();">
					<div class="col-md-12">		
						<div class="stats-wrap">
							<div class="stats-section main">
								<h3 class="stats-title main">기관선택</h3>
								<div class="search-state">
									<input type="checkbox" class="" onchange="allCheck(this, 'unit')">
									<input type="text" class="form-control" placeholder="기관명 입력" onkeyup="chgSearUnit(this.value);">
									<button type="button" class="boot_btn boot_btn_primary search"></button>
								</div>
								<div class="stats-list-content">
									<c:forEach var="unit" items="${unitList }">
										<c:if test="${unit.unitCd ne '00' }">
											<div class="stats-check">
												<input type="checkbox" class="searchUnitCdList unit" name="searchUnitCdList" title="${unit.unitNm }" id="${unit.unitCd }" value="${unit.unitCd }">
												<label for="${unit.unitCd }"><c:out value="${unit.unitNm }"/></label>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							
							<div class="stats-section sub">
								<div class="stats-title sub" style="line-height: 30px;padding-right: 5px;;">
									<!-- 검색 필터 -->
										<div class="search-input-box">
											<span class="fl" style="line-height: 30px;">검색 기간 : </span>
											<input type="text" class="form-control fl dateFormat" name="searchBgnDe" id="searchBgnDe" style="display: inline-block;" required="required" autocomplete="off">
												<span class="fl">~</span>
											<input type="text" class="form-control fl dateFormat" name="searchEndDe" id="searchEndDe" style="display: inline-block;" required="required" autocomplete="off">
										</div>
										<button type="button" class="boot_btn boot_btn-primary register" onclick="fnShow()" style="width: 90px;align-self: flex-end;float: right;padding: 5px;">
											Excel 등록
										</button>
								</div>
								<div>
								
									<div class="stats-list-wrap">
										<div class="stats-list-title">
											<input type="checkbox" id="001" class="depth0" onchange="allCheck(this, 'depth0')">
											<label	for="001">대분류</label>
										</div>
										<div class="stats-list-content">
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="100" data-value="담당구분">
												<label for="100">담당구분</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="101" data-value="통계활용구분">
												<label for="101">통계활용구분</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="102" data-value="단체명">
												<label for="102">단체명</label>
											</div>  
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="103" data-value="입실일">
												<label for="103">입실일</label>
											</div> 
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="104" data-value="퇴실일">
												<label for="104">퇴실일</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="105" data-value="숙박일수">
												<label for="105">숙박일수</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="106" data-value="정산서기준인원">
												<label for="106">정산서기준인원</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="107" data-value="성별">
												<label for="107">성별</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="108" data-value="연령구분">
												<label for="108">연령구분</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="109" data-value="매출액">
												<label for="109">매출액</label>
											</div>
											<div class="stats-check">
												<input type="checkbox" class="depth0" id="110" data-value="취소여부">
												<label for="110">취소여부</label>
											</div>
										</div>
									</div>
									
									<div class="stats-list-wrap">
										<div class="stats-list-title">
											<input type="checkbox" id="002" class="depth1_chk" onchange="allCheck(this, 'depth1')">
											<label	for="002">소분류</label>
										</div>
										<div class="stats-list-content">
											<div class="stats-inner-list" data-value="담당구분">
												<div class="stats-inner-title">
													담당구분
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분">
												<div class="stats-inner-title">
													통계활용구분
												</div>
											</div>
											<div class="stats-inner-list" data-value="단체명">
												<div class="stats-inner-title">
													단체명
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('단체명')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="입실일">
												<div class="stats-inner-title">
													입실일
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('입실일')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="퇴실일">
												<div class="stats-inner-title">
													퇴실일
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('퇴실일')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="숙박일수">
												<div class="stats-inner-title">
													숙박일수
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('숙박일수')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="정산서기준인원">
												<div class="stats-inner-title">
													정산서기준인원
												</div>
											</div>
											<div class="stats-inner-list" data-value="성별">
												<div class="stats-inner-title">
													성별
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분">
												<div class="stats-inner-title">
													연령구분
												</div>
											</div>	 
											<div class="stats-inner-list" data-value="매출액">
												<div class="stats-inner-title">
													매출액
												</div>
											</div>
											<div class="stats-inner-list" data-value="취소여부">
												<div class="stats-inner-title">
													취소여부
												</div>
											</div>
										</div>
									</div>
									
									<div class="stats-list-wrap">
										<div class="stats-list-title">
											<input type="checkbox" id="003" class="depth2_chk" onchange="allCheck(this, 'depth2')">
											<label	for="003">세분류1</label>
										</div>
										<div class="stats-list-content">
											<div class="stats-inner-list" data-value="담당구분_월">
												<div class="stats-inner-title">
													담당구분 / 월
												</div>
											</div>
											<div class="stats-inner-list" data-value="담당구분_담당팀">
												<div class="stats-inner-title">
													담당구분 / 담당팀
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('담당구분_담당팀')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="담당구분_담당자">
												<div class="stats-inner-title">
													담당구분 / 담당자
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('담당구분_담당자')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_사업별구분">
												<div class="stats-inner-title">
													통계활용구분 / 사업별구분
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_프로그램구분">
												<div class="stats-inner-title">
													통계활용구분 / 프로그램구분
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_프로그램유형">
												<div class="stats-inner-title">
													통계활용구분 / 프로그램유형
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_개인단체구분">
												<div class="stats-inner-title">
													통계활용구분 / 개인/단체구분
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_인원유형(대분류)">
												<div class="stats-inner-title">
													통계활용구분 / 인원유형(대분류)
												</div>
											</div>
											<div class="stats-inner-list" data-value="통계활용구분_인증프로그램유형">
												<div class="stats-inner-title">
													통계활용구분 / 인증프로그램유형
												</div>
											</div>
											<div class="stats-inner-list" data-value="정산서기준인원_순인원">
												<div class="stats-inner-title">
													정산서기준인원 / 순인원
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('정산서기준인원_순인원')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="정산서기준인원_연인원">
												<div class="stats-inner-title">
													정산서기준인원 / 연인원
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('정산서기준인원_연인원')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="성별_남">
												<div class="stats-inner-title">
													성별 / 남
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('성별_남')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="성별_여">
												<div class="stats-inner-title">
													성별 / 여
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('성별/여')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_미취학">
												<div class="stats-inner-title">
													연령구분 / 미취학
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_미취학')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_10대">
												<div class="stats-inner-title">
													연령구분 / 10대
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_10대')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_20대">
												<div class="stats-inner-title">
													연령구분 / 20대
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_20대')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_30대">
												<div class="stats-inner-title">
													연령구분 / 30대
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_30대')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_40대">
												<div class="stats-inner-title">
													연령구분 / 40대
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_40대')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_50대">
												<div class="stats-inner-title">
													연령구분 / 50대
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_50대')">추가</button>
												</div>
											</div>
											<div class="stats-inner-list" data-value="연령구분_60대이상">
												<div class="stats-inner-title">
													연령구분 / 60대 이상
													<button type="button" class="boot_btn boot_btn-primary register stats-inner-btn" onclick="addItem('연령구분_60대이상')">추가</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="stats-list-wrap">
										<div class="stats-list-title">
											<input type="checkbox" id="004" class="depth3_chk" onchange="allCheck(this, 'depth3')">
											<label	for="004">세분류2</label>
										</div>
										<div class="stats-list-content">
											<c:forEach var="item" items="${nofprClsList}">
												<div class="stats-inner-list" data-value="${item.codeIdx}">
													<div class="stats-inner-title">
														통계활용구분 / 인원유형(대분류) / <c:out value="${item.codeNm}"/>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 20px;">
							<p style="color: #0f8c00;font-weight: bolder;">
							※조회 결과가 나오지 않을 시 브라우저 설정을 확인해 주시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;브라우저 [설정] → [개인정보 및 보안] → [사이트 설정] → [팝업 및 리디렉션] → 허용으로 설정
							</p>
						</div>
						<div style="margin-top:20px; text-align:right;">
							<button type="submit" class="boot_btn boot_btn-primary register" >검색</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<c:import url="/template/bottom.do" charEncoding="utf-8"/>