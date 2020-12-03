function createXMLHttpRequest(){
	var xmlReq = false;
	
	if(window.XMLHttpRequest){
		xmlReq = new XMLHttpRequest();  //Non-Microsoft Browser
	}else if(window.ActiveXObject){  //Microsoft Borwer
		try{
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");  // version6 이후
		}catch(e){ 
			xmlReq = new ActiveXObject("Microsoft.XMLHTTP"); //version6 이전
		}
	}	
	return xmlReq;
}