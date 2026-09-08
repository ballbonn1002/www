package com.cubesofttech.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ArticleDAO;
import com.cubesofttech.dao.FooterDAO;
import com.cubesofttech.model.Footer;
import com.opensymphony.xwork2.ActionSupport;

public class FooterAction extends ActionSupport {
    private static final Logger log = Logger.getLogger(FooterAction.class);
    private static final long serialVersionUID = 1L;

    @Autowired
    private FooterDAO footerDAO;
    @Autowired
	private ArticleDAO articleDAO;

    private HttpServletRequest request = ServletActionContext.getRequest();

    public String list() {
        
        try {
        	HttpSession session = request.getSession();
            List<Map<String, Object>> articleList = articleDAO.findLatestArticlesByTypeWithPageUri();
        	List<Footer> footerList = footerDAO.findParent();
        	List<Map<String, Object>> footerChild = footerDAO.findAllChildFooter();
        	
            session.setAttribute("Footer", footerList);
            session.setAttribute("ChildFooter", footerChild);
            session.setAttribute("Article", articleList);
            
            //log.debug(footerList);
            //log.debug(footerChild);
            
            return SUCCESS;
        } catch (Exception e) {
            log.error("Error occurred while fetching footer data", e);
            return ERROR;
        }
    }
}
