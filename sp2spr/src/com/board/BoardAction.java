package com.board;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

public class BoardAction extends ActionSupport implements Preparable, ModelDriven<BoardDTO> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private BoardDTO dto;

	public BoardDTO getDto() {
		return dto;
	}

	@Override
	public BoardDTO getModel() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new BoardDTO();
	}

	@Resource(name = "page")
	private DBPaging page;
	@Resource(name = "dao")
	private CommonDAO dao;
	// 여기에다가 알아서 넣어줌.

	public String created() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (dto == null || dto.getMode() == null || dto.getMode().equals("")) {
			return INPUT;
		}

		int numMax = dao.getIntValue("board.numMax");
		dto.setNum(numMax + 1);
		dto.setIpAddr(request.getRemoteAddr());
		dao.insertData("board.insertData", dto);

		return SUCCESS;
	}

	public String list() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		String cp = request.getContextPath();

		int numPerPage = 5;
		int totalPage = 0;
		int totalDataCount = 0;

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");

		if (searchValue == null) {
			searchKey = "subject";
			searchValue = "";
		}

		if (request.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}

		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("SEARCHKEY", searchKey);
		hMap.put("SEARCHVALUE", searchValue);
		totalDataCount = dao.getIntValue("board.dataCount", hMap);
		if (totalDataCount != 0) {
			totalPage = page.getPageCount(numPerPage, totalDataCount);
		}
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		hMap.put("start", start);
		hMap.put("end", end);

		List<Object> list = (List<Object>) dao.getListData("board.listData", hMap);

		int listNum, n = 0;

		Iterator<Object> lit = list.iterator();
		while (lit.hasNext()) {
			BoardDTO vo = (BoardDTO) lit.next();
			listNum = totalDataCount - (start + n - 1);
			vo.setListNum(listNum);
			n++;
		}

		String params = "";
		String urlArticle = "";
		String urlList = "";

		if (!searchValue.equals("")) {
			searchValue = URLEncoder.encode(searchValue, "UTF-8");
			params = "searchKey=" + searchKey;
			params += "&searchValue=" + searchValue;
		}

		urlList = cp + "/bbs/list.action";
		urlArticle = cp + "/bbs/article.action?pageNum=" + currentPage;

		if (!params.equals("")) {
			urlList += "?" + params;
			urlArticle += "&" + params;
		}

		request.setAttribute("list", list);
		request.setAttribute("urlList", urlList);
		request.setAttribute("urlArticle", urlArticle);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageIndexList", page.pageIndexList(currentPage, totalPage, urlList));

		return SUCCESS;
	}

	public String article() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String pageNum = request.getParameter("pageNum");
		if (searchValue == null) {
			searchKey = "subject";
			searchValue = "";
		} else {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}

		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		dto = (BoardDTO) dao.getReadData("board.getData", num);

		if (dto == null) {
			System.out.println("에러");
		}

		String param = "";
		param = "pageNum=" + pageNum;
		param += "&num=" + num;
		if (!searchValue.equals("")) {
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		int lineSu = dto.getContent().split("\r\n").length;
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

		request.setAttribute("lineSu", lineSu);
		request.setAttribute("params", param);
		return SUCCESS;
	}

	public String update() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String pageNum = request.getParameter("pageNum");
		
		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		String param = "";
		param = "pageNum=" + pageNum;
		param += "&num=" + num;
		if (searchValue == null) {
			searchKey = "subject";
			searchValue = "";
		} else {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		if (!searchValue.equals("")) {
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		System.out.println(dto==null);
		
		if (dto == null || dto.getMode() == null || dto.getMode().equals("")) {
			dto = (BoardDTO) dao.getReadData("board.getData", num);
			request.setAttribute("params", param);
			return INPUT;
		}

		dao.updateData("board.updateData", dto);
		request.setAttribute("params", param);
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int num = 0;
		if(request.getParameter("num")!=null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		dao.deleteData("board.deleteData", num);
		return SUCCESS;
	}	
}
