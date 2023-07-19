/**
 * 
 */

function checkData(){
	var productName = document.getElementById("productName");
	var companyId = document.getElementById("companyId");
	var price = document.getElementById("price");
	var detail = document.getElementById("detail");
	var imgName = document.getElementById("imgName");
	var createDate = document.getElementById("createDate");

	if(productName.value == ""){
		productName.focus();
		alert('상품명이 비어있습니다.');
		return false;
	}
	if(companyId.value == ""){
		companyId.focus();
		alert('브랜드명이 비어있습니다.');
		return false;
	}
	if(price.value == ""){
		price.focus();
		alert('가격이 비어있습니다.');
		return false;
	}
	if(detail.value == ""){
		detail.focus();
		alert('상세정보가 비어있습니다.');
		return false;
	}
	if(imgName.value == ""){
		imgName.focus();
		alert('이미지가 비어있습니다.');
		return false;
	}
	if(createDate.value == ""){
		createDate.focus();
		alert('생산일이 비어있습니다.');
		return false;
	}
	
	if(detail.value.length < 10){
		detail.focus();
		alert('상세정보는 최소 10글자 이상이여야 합니다.');
		return false;
	}
	return true;
}


function resetData(){
	alert('작성한 모든 데이터를 초기화합니다.');
	return true;
}