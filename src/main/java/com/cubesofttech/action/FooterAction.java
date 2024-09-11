package com.cubesofttech.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.FooterDAO;
import com.cubesofttech.model.Footer;
import com.opensymphony.xwork2.ActionSupport;

public class FooterAction extends ActionSupport {
    private static final Logger log = Logger.getLogger(FooterAction.class);
    private static final long serialVersionUID = 1L;

    @Autowired
    private FooterDAO footerDAO;

    private List<Footer> footerList;
    private Footer footer;
    private String userCreate;
    private String subFooterList;

    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response = ServletActionContext.getResponse();
    
    public String list() {
        
        try {
        	HttpSession session = request.getSession();
            List<Map<String, Object>> footerList = footerDAO.findAll();
            List<Map<String, Object>> newsList = footerDAO.findByFooterName("News");
            List<Map<String, Object>> blogList = footerDAO.findByFooterName("Blog");
            List<Map<String, Object>> careersList = footerDAO.findByFooterName("Careers");

            session.setAttribute("Footer", footerList);
            session.setAttribute("Blog", blogList);
            session.setAttribute("Careers", careersList);
            session.setAttribute("News", newsList);

            return SUCCESS;
        } catch (Exception e) {
            log.error("Error occurred while fetching footer data", e);
            return ERROR;
        }
    }

    // Getters and setters
    public FooterDAO getFooterDAO() {
        return footerDAO;
    }

    public void setFooterDAO(FooterDAO footerDAO) {
        this.footerDAO = footerDAO;
    }

    public List<Footer> getFooterList() {
        return footerList;
    }

    public void setFooterList(List<Footer> footerList) {
        this.footerList = footerList;
    }

    public Footer getFooter() {
        return footer;
    }

    public void setFooter(Footer footer) {
        this.footer = footer;
    }

    public String getUserCreate() {
        return userCreate;
    }

    public void setUserCreate(String userCreate) {
        this.userCreate = userCreate;
    }

    public String getSubFooterList() {
        return subFooterList;
    }

    public void setSubFooterList(String subFooterList) {
        this.subFooterList = subFooterList;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }
}
