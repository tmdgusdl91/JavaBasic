package com.util;

import org.springframework.stereotype.Service;


//dao는 Repository를 사용하고 일반 클레스에서는 Service를 사용한다.
@Service("page")
public class DBPaging {
	// 전체 페이지 수 구하기
	public int getPageCount(int numPerPage, int dataCount) {
		// 페이지당갯수 , 전체데이터갯수
		int page = 0;

		page = dataCount / numPerPage;

		if (dataCount % numPerPage != 0)
			page++;

		return page;
	}

	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		int numPerBlock = 5;
		int currentPageSetup;
		int page;

		StringBuffer sb = new StringBuffer();
		if (currentPage == 0 || totalPage == 0) {
			return null;
		}
		if (listUrl.indexOf("?") != -1) {
			listUrl = listUrl + "&";
		} else {
			listUrl = listUrl + "?";
		}
		// currentPageSetup( 표시한 페이지 -1 )
		// 이전버튼 공식	
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		if (currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		if (totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전　</a>");

		}
		// 바로가기 페이지
		page = currentPageSetup + 1;
		while (page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			if (page == currentPage) {
				sb.append("<font color='RED'><b>　" + page + "　</b></font>");
			} 
			else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">　" + page + "　</a>");
			}
			page++;
		}

		if ((currentPageSetup + numPerBlock + 1) <= totalPage) {
			// (totalPage-currentPageSetup > numPerBlock)
			sb.append("<a href=\"" + listUrl + "pageNum=" + (currentPageSetup + numPerBlock + 1) + "\">　다음▶</a>");
			// ("<a href=\"" + listUrl + "pageNum=" + page + "\"> 다음▶</a>;)"
		}
		return sb.toString();
	}

	
	//JavaScript로 페이징 처리
	public String pageIndexList(int currentPage, int totalPage) {
		int numPerBlock = 5;
		int currentPageSetup;
		int n;
		int page;
		String strList="";
		
		if(currentPage == 0) {
			return null;
		}
		
		//표시할 첫페이지
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		//1페이지
		if((totalPage>numPerBlock)&&(currentPageSetup>0)) {
			strList = "<a onclick='listPage(1);'>1</a>";
		}
		
		//◀이전 : 총 페이지 수가 numPerBlock 이상인 경우 numPerBlock을 보여줌
		n = currentPage - numPerBlock;
		if(totalPage>numPerBlock && currentPageSetup>0) {
			strList += "<a onlclick='listPage("+n+");'>◀이전</a>";
		}
		
		//바로 가기 페이지
		page =currentPageSetup +1;
		while ((page<=totalPage) && (page<=currentPageSetup+numPerBlock)) {
			if(page == currentPage) {
				strList+="<font color = 'Pink'>"+ page + "</font>";
			}else {
				strList+="<a onclick='listPage("+page+");'> "+page+" </a>";
			}
			page++;
		}
		
		//다음▶
		n = currentPage+numPerBlock+1;
		if(totalPage-currentPageSetup>numPerBlock) {
			strList+="<a onclick='listPage("+n+");'>다음▶</a>";
		}
		
		//마지막페이지
		if((totalPage>numPerBlock) && (currentPageSetup+numPerBlock<totalPage)) {
			strList+="<a onclick='listPage("+totalPage+");'>"+totalPage+"</a>";
		}
		
		return strList;
	}
}
