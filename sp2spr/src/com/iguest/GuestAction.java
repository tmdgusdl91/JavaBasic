package com.iguest;

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
import com.util.dao.CommonDAOImpl;

public class GuestAction extends ActionSupport implements Preparable, ModelDriven<GuestDTO> {

	private GuestDTO dto;
	
	
	//AJax를 사용하기 때문에 getter가 필요없다.
	/*
	public GuestDTO getDto() {
		return dto;
	}
	*/
	
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
		int numMax = dao.getIntValue("iguest.numMax");
		dto.setNum(numMax+1);
		dto.setIpAddr(request.getRemoteAddr());
		dao.insertData("iguest.insertData", dto);
		return list();
	}

	public String list() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int numPerPage = 3;
		int totalPage = 0;
		int currentPage = 1;
		int totalDataCount = 0;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}else {
			pageNum = "1";
		}
		
		totalDataCount = dao.getIntValue("iguest.dataCount");
		
		if(totalDataCount!=0) {
			totalPage = page.getPageCount(numPerPage, totalDataCount);
		}
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		int start = (currentPage-1)*numPerPage+1;
		int end = (currentPage)*numPerPage;
		hMap.put("start", start);
		hMap.put("end", end);
		
		List<Object> list = (List<Object>)dao.getListData("iguest.listData",hMap);
		
		int listNum, n = 0;
		Iterator<Object> lit = list.iterator();
		while(lit.hasNext()) {
			GuestDTO vo = (GuestDTO) lit.next();
			listNum = totalDataCount - (start + n - 1);
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
	
	public String deleted() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		int num = 0;
		if(request.getParameter("num")!=null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		dao.deleteData("iguest.deleteData", num);
		
		return list();		
	}
}

