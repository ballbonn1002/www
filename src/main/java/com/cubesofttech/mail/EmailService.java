package com.cubesofttech.mail;

import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service("emailService")
public class EmailService {
    
	@Autowired
    private JavaMailSender mailSender;
    
	Logger log = Logger.getLogger(getClass());
	
    /**
     * This method will send compose and send the message 
     * */
    public void sendMail(String user,String leaveType,String description,String halfDay,String from,String endDate,BigDecimal noDay) 
    {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("test@cubesofttech.com");
        message.setTo("contact@gmail.com");
        message.setSubject("test1111test");
        message.setText("user = "+user+" leaveType = "+leaveType+" description = "+description+" halfDay = "+ halfDay+" from = "+from+" to ="+ endDate+" noDay = "+noDay);
        mailSender.send(message);
        
        Log.debug(message);
    }
    
    public void sendEmailJob(String name, String email, String tel, String position, String msg, File file, String fileName) {
    	try {
   
    		MimeMessage message = mailSender.createMimeMessage();
    		MimeMessageHelper helper = new MimeMessageHelper(message, true);
    		helper.setFrom("contact@cubesofttech.com");
    		helper.setTo("contact@cubesofttech.com");
    		helper.setSubject("Apply : " + position);
    		helper.setText("Cube SoftTech \n Name : "+name+"\n E-mail : "+email+"\n Telephone : "+tel
							+"\n Position : "+position+"\n Message : \n"+msg);
    		
    		if (file != null) {
    	 		HttpServletRequest request = ServletActionContext.getRequest();
        		ServletContext context = request.getServletContext();
        		String fileServerPath = context.getRealPath("/");
        		Path path = Paths.get(fileServerPath+"/upload/email/"+fileName);
        		log.debug(path);
        		byte[] content = Files.readAllBytes(path);
        		log.debug(content);
    			helper.addAttachment(fileName, new ByteArrayResource(content));
    		}
    		
			log.debug("message" + message);
			mailSender.send(message);
			log.debug("success");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
    

    public void sendEmailContact(String name, String email, String tel, String msg) {
    	try {
    		SimpleMailMessage message = new SimpleMailMessage();
    		message.setFrom("contact@cubesofttech.com");
    		message.setTo("contact@cubesofttech.com");
    		message.setSubject("Contact message from Website.");
    		message.setText("Cube SoftTech \n Name : "+name+"\n E-mail : "+email+"\n Telephone : "+tel+"\n Message : \n"+msg);
    		log.debug("message" + message);
    		mailSender.send(message);
    		
    		log.debug("message" + message);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }

  
}