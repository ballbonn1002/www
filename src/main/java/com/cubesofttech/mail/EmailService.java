package com.cubesofttech.mail;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
 
public class EmailService {
    
	@Autowired
    private JavaMailSender mailSender;
    
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	Logger log = Logger.getLogger(getClass());
	
    /**
     * This method will send compose and send the message 
     * */
    public void sendMail(String user,String leaveType,String description,String halfDay,String from,String endDate,BigDecimal noDay) 
    {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("test@cubesofttech.com");
        message.setTo("ohoh2555@gmail.com");
        message.setSubject("test1111test");
        message.setText("user = "+user+" leaveType = "+leaveType+" description = "+description+" halfDay = "+ halfDay+" from = "+from+" to ="+ endDate+" noDay = "+noDay);
        mailSender.send(message);
        
        Log.debug(message);
    }
    
    public void sendEmailJob(String name, String email, String tel, String position) {
    	try {
	    /*	String name = request.getParameter("contactName");
	    	String email = request.getParameter("contactEmail");
	    	String tel = request.getParameter("contactTel");
	    	String position = request.getParameter("contactPosition");*/
	    	
			SimpleMailMessage message = new SimpleMailMessage();
	    	message.setFrom(email);
			message.setTo("siroratchanchom@gmail.com");
			message.setSubject("Apply : " + position);
			message.setText("Cube SoftTech \n Position : "+position+ "\n Name : "+name);
			mailSender.send(message);
			log.debug("success");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }



  
}