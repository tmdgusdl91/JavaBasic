package com.iguest2;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.util.DBPaging;
import com.util.dao.CommonDAO;

public class GuestAction extends ActionSupport implements Preparable, ModelDriven<GuestDTO>{

	private GuestDTO dto;
	
	@Override
	public GuestDTO getModel() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new GuestDTO();		
	}
	
	@Resource(name="dao")
	private CommonDAO dao;
	
	@Resource(name="page")
	private DBPaging page;
	
	public String created() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		dto.setNum(dao.getIntValue("iguest2.numMax")+1);
		dto.setIpAddr(request.getRemoteAddr());		
		dao.insertData("iguest2.insertData", dto);		
		return list();
	}
	
	public String list() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int numPerPage = 5;
		int totalPage, currentPage, totalDataCount;
		
		if(request.getParameter("pageNum")!=null) {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
		}else {
			currentPage = 1;
		}
		
		totalDataCount = dao.getIntValue("iguest2.dataCount");
		
		if(totalDataCount!=0) {
			totalPage = page.getPageCount(numPerPage, totalDataCount);
		}else {
			totalPage = 0;
		}
		
		if(currentPage>totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage-1)*numPerPage+1;
		int end = (currentPage)*numPerPage;
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("start", start);
		hMap.put("end", end);
		
		List<Object> list = (List<Object>)dao.getListData("iguest2.listData",hMap);
		
		int listNum , n = 0;
		Iterator<Object> lit = list.iterator();
		while(lit.hasNext()) {
			GuestDTO vo = (GuestDTO) lit.next();
			listNum = totalDataCount - (start+n-1);
			vo.setListNum(listNum);
			vo.setContent(vo.getContent().replaceAll("\r\n", "<br/>"));
			n++;
		}
		
		String pageIndexList = page.pageIndexList(currentPage, totalPage);
		
		request.setAttribute("list", list);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("totalDataCount", totalDataCount);		
		
		return SUCCESS;
	}
	
	public  String deleted() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		int num = 0;
		if(request.getParameter("num")!=null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		dao.deleteData("iguest2.deleteData", num);
		return list();
	}
}
