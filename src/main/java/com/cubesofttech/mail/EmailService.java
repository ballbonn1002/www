package com.cubesofttech.mail;

import java.io.File;
import java.nio.file.Files;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
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

    public void sendEmailJob(String name, String email, String tel, String position, String msg, File file, String fileName) throws Exception {
    	MimeMessage message = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(message, true);
    	// CEO's instruction 2026-08-18: revert to contact@ per original setup.
    	// From must match mailSender's login (beans.xml, now chatchai.k) - the
    	// server rejects a From/To that doesn't match the authenticated account
    	// (anti-spoofing), and chatchai.k's password is confirmed dead - so this
    	// is expected to fail until CEO's decision changes.
    	helper.setFrom("contact@cubesofttech.com");
    	helper.setTo("contact@cubesofttech.com");
    	helper.setSubject("Apply : " + position);
    	helper.setText("Cube SoftTech \n Name : "+name+"\n E-mail : "+email+"\n Telephone : "+tel
						+"\n Position : "+position+"\n Message : \n"+msg);

    	if (file != null) {
    		byte[] content = Files.readAllBytes(file.toPath());
    		helper.addAttachment(fileName, new ByteArrayResource(content));
    	}

		mailSender.send(message);
		log.debug("success");
    }


    public void sendEmailContact(String firstName, String lastName, String email, String tel, String msg) throws Exception {
    	String name = firstName + " " + lastName;
    	SimpleMailMessage message = new SimpleMailMessage();
    	// CEO's instruction 2026-08-18: revert to contact@ - see sendEmailJob().
    	message.setFrom("contact@cubesofttech.com");
    	message.setTo("contact@cubesofttech.com");
    	message.setSubject("Contact message from Website.");
    	message.setText("Cube SoftTech \n Name : "+name+"\n E-mail : "+email+"\n Telephone : "+tel+"\n Message : \n"+msg);
    	log.debug(message);
    	mailSender.send(message);
    }


}
