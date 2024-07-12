/*
 * EncodingFilter.java
 *
 * Created on December 19, 2006, 2:57 PM
 */

package com.cubesofttech.util;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.cubesofttech.dao.PageUriDAO;
import com.cubesofttech.model.PageUri;
import com.cubesofttech.system.Constant;

/**
 *
 * @author  weerawatp
 * @version
 */


public class RewriteFilter implements Filter {

     private static Logger log = Logger.getLogger(RewriteFilter.class);
     

@Autowired
private Constant constant;

@Autowired
private PageUriDAO pageUriDAO;

private String metaDescription = "Cube SoftTech is an innovative, high-quality software development company. We are a professional company, focused on IT consulting, web application development &amp; integration. Our services cover every aspect of web / mobile development, from start to finish. From one off projects to a fully outsourced development team., Java Outsourcing, IT Staff Outsourcing, IT Outsource, Staff Outsourcing, IT Staffing solutions, Outsource IT Staff, เอ้าซอร์สซิ่ง, ไอที เอ้าซอร์สซิ่ง";

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured.
    private FilterConfig filterConfig = null;
    
    public RewriteFilter() {
    }
    
    /**
     * 
     * @param response http response
     * @param request The servlet request we are processing
     * @param chain The filter chain we are processing
     * @exception IOException if an input/output error occurs*
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
    	String requestURI = this.getRequestURI(request);
    	log.debug("RewriteFilterget Request URI : " + requestURI);
    	
    	PageUri pageUri = null;
		try {
			pageUri = pageUriDAO.findById(requestURI);
			log.debug("pageURI found");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	if (pageUri != null) {
    		request.setAttribute("title", pageUri.getTitle());
    		request.setAttribute("meta", pageUri.getMeta());
    		request.getRequestDispatcher(pageUri.getForwardTo()).forward(request, response);
    		return;
    	} else {
    		request.setAttribute("title", "");
    		request.setAttribute("meta", metaDescription);
    		log.debug("do filter chain");
    		chain.doFilter(request, response);
    	}
        
    }
    
    
    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }
    
    
    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        
        this.filterConfig = filterConfig;
    }
    
    /**
     * Destroy method for this filter
     *
     */
    public void destroy() {
    }
    
    
    /**
     * Init method for this filter
     *
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
          filterConfig.getServletContext());
    }
    
    
    /**
     * Return a String representation of this object.
     */
    public String toString() {
        
        if (filterConfig == null) return ("EncodingFilter()");
        StringBuffer sb = new StringBuffer("EncodingFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
        
    }
    
    
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        
        String stackTrace = getStackTrace(t);
        
        if(stackTrace != null && !stackTrace.equals("")) {
            
            try {
                
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N
                
                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();;
            }
            
            catch(Exception ex){ }
        }
			else {
			            try {
			                PrintStream ps = new PrintStream(response.getOutputStream());
			                t.printStackTrace(ps);
			                ps.close();
			                response.getOutputStream().close();;
			            }
			catch(Exception ex){ }
			}
    }
    
    public static String getStackTrace(Throwable t) {
        
        String stackTrace = null;
        
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        }
        catch(Exception ex) {}
	        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
    
    private static final boolean debug = true;
    
    public static String getCurrentUrlFromRequest(ServletRequest request)
    {
       if (! (request instanceof HttpServletRequest))
           return null;

       return getCurrentUrlFromRequest((HttpServletRequest)request);
    }

    public static String getCurrentUrlFromRequest(HttpServletRequest request)
    {
        StringBuffer requestURL = request.getRequestURL();
        String queryString = request.getQueryString();
        

        if (queryString == null)
            return requestURL.toString();

        return requestURL.append('?').append(queryString).toString();
    }
    
    public static String getRequestURI(ServletRequest request)
    {
       if (! (request instanceof HttpServletRequest))
           return null;

       return getRequestURI((HttpServletRequest)request);
    }
    
    public static String getRequestURI(HttpServletRequest request) {

        
        String requestURI = request.getRequestURI();
    	String queryString = request.getQueryString();


        if (queryString == null) {
            return requestURI.toString();
        } else {
        	return requestURI.toString() + (queryString).toString();
        }
    }
    
    
}
