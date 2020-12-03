package com.util;

import org.springframework.stereotype.Service;


//dao�� Repository�� ����ϰ� �Ϲ� Ŭ���������� Service�� ����Ѵ�.
@Service("page")
public class DBPaging {
	// ��ü ������ �� ���ϱ�
	public int getPageCount(int numPerPage, int dataCount) {
		// �������簹�� , ��ü�����Ͱ���
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
		// currentPageSetup( ǥ���� ������ -1 )
		// ������ư ����	
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		if (currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		if (totalPage > numPerBlock && currentPageSetup > 0) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">��������</a>");

		}
		// �ٷΰ��� ������
		page = currentPageSetup + 1;
		while (page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			if (page == currentPage) {
				sb.append("<font color='RED'><b>��" + page + "��</b></font>");
			} 
			else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">��" + page + "��</a>");
			}
			page++;
		}

		if ((currentPageSetup + numPerBlock + 1) <= totalPage) {
			// (totalPage-currentPageSetup > numPerBlock)
			sb.append("<a href=\"" + listUrl + "pageNum=" + (currentPageSetup + numPerBlock + 1) + "\">��������</a>");
			// ("<a href=\"" + listUrl + "pageNum=" + page + "\"> ������</a>;)"
		}
		return sb.toString();
	}

	
	//JavaScript�� ����¡ ó��
	public String pageIndexList(int currentPage, int totalPage) {
		int numPerBlock = 5;
		int currentPageSetup;
		int n;
		int page;
		String strList="";
		
		if(currentPage == 0) {
			return null;
		}
		
		//ǥ���� ù������
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		//1������
		if((totalPage>numPerBlock)&&(currentPageSetup>0)) {
			strList = "<a onclick='listPage(1);'>1</a>";
		}
		
		//������ : �� ������ ���� numPerBlock �̻��� ��� numPerBlock�� ������
		n = currentPage - numPerBlock;
		if(totalPage>numPerBlock && currentPageSetup>0) {
			strList += "<a onlclick='listPage("+n+");'>������</a>";
		}
		
		//�ٷ� ���� ������
		page =currentPageSetup +1;
		while ((page<=totalPage) && (page<=currentPageSetup+numPerBlock)) {
			if(page == currentPage) {
				strList+="<font color = 'Pink'>"+ page + "</font>";
			}else {
				strList+="<a onclick='listPage("+page+");'> "+page+" </a>";
			}
			page++;
		}
		
		//������
		n = currentPage+numPerBlock+1;
		if(totalPage-currentPageSetup>numPerBlock) {
			strList+="<a onclick='listPage("+n+");'>������</a>";
		}
		
		//������������
		if((totalPage>numPerBlock) && (currentPageSetup+numPerBlock<totalPage)) {
			strList+="<a onclick='listPage("+totalPage+");'>"+totalPage+"</a>";
		}
		
		return strList;
	}
}
