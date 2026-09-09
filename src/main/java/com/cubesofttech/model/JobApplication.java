package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "job_application")
public class JobApplication implements Serializable {

	public JobApplication() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_application_id")
	private Long jobApplicationId;

	@Column(name = "position")
	private String position;

	@Column(name = "name")
	private String name;

	@Column(name = "email")
	private String email;

	@Column(name = "tel")
	private String tel;

	@Column(name = "message")
	private String message;

	@Column(name = "resume_filename")
	private String resumeFilename;

	@Column(name = "resume_path")
	private String resumePath;

	@Column(name = "resume_size_bytes")
	private Long resumeSizeBytes;

	@Column(name = "email_from")
	private String emailFrom;

	@Column(name = "email_to")
	private String emailTo;

	@Column(name = "email_status")
	private String emailStatus;

	@Column(name = "email_error")
	private String emailError;

	@Column(name = "time_create")
	private Timestamp timeCreate;

	public Long getJobApplicationId() {
		return jobApplicationId;
	}

	public void setJobApplicationId(Long jobApplicationId) {
		this.jobApplicationId = jobApplicationId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getResumeFilename() {
		return resumeFilename;
	}

	public void setResumeFilename(String resumeFilename) {
		this.resumeFilename = resumeFilename;
	}

	public String getResumePath() {
		return resumePath;
	}

	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}

	public Long getResumeSizeBytes() {
		return resumeSizeBytes;
	}

	public void setResumeSizeBytes(Long resumeSizeBytes) {
		this.resumeSizeBytes = resumeSizeBytes;
	}

	public String getEmailFrom() {
		return emailFrom;
	}

	public void setEmailFrom(String emailFrom) {
		this.emailFrom = emailFrom;
	}

	public String getEmailTo() {
		return emailTo;
	}

	public void setEmailTo(String emailTo) {
		this.emailTo = emailTo;
	}

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	public String getEmailError() {
		return emailError;
	}

	public void setEmailError(String emailError) {
		this.emailError = emailError;
	}

	public Timestamp getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}
}
