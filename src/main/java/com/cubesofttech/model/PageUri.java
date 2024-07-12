package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "page_uri")
@NamedQueries({ @NamedQuery(name = "PageUri.findAll", query = "SELECT t FROM PageUri t") })
public class PageUri  {

	public PageUri() {
		
	}

	public PageUri(String pageUriId
			,String forwardTo
			,String model
			,String modelId
			,String description
			,String title
			,String meta
			,String userCreate
			,java.sql.Timestamp timeCreate
			,String userUpdate
			,java.sql.Timestamp timeUpdate
			) {
		this.pageUriId=pageUriId;
		this.forwardTo=forwardTo;
		this.model=model;
		this.modelId=modelId;
		this.description=description;
		this.title=title;
		this.meta=meta;
		this.userCreate=userCreate;
		this.timeCreate=timeCreate;
		this.userUpdate=userUpdate;
		this.timeUpdate=timeUpdate;
	}
	
	@Id
	@Column(name = "page_uri_id")
	private String pageUriId;
	
	@Column(name = "forward_to")
	private String forwardTo;
	
	@Column(name = "model")
	private String model;

	@Column(name = "model_id")
	private String modelId;
	
	@Column(name = "description")
	private String description;
	
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "meta")
	private String meta;
	
	
	@Column(name = "user_create")
	private String userCreate;
	
	@Column(name = "time_create")
	private java.sql.Timestamp timeCreate;
	
	
	@Column(name = "user_update")
	private String userUpdate;
	
	
	@Column(name = "time_update")
	private java.sql.Timestamp timeUpdate;


	public String getPageUriId() {
		return pageUriId;
	}

	public void setPageUriId(String pageUriId) {
		this.pageUriId = pageUriId;
	}

	public String getForwardTo() {
		return forwardTo;
	}

	public void setForwardTo(String forwardTo) {
		this.forwardTo = forwardTo;
	}
	
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
	
	public String getModelId() {
		return modelId;
	}

	public void setModelId(String modelId) {
		this.modelId = modelId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMeta() {
		return meta;
	}

	public void setMeta(String meta) {
		this.meta = meta;
	}

	public String getUserCreate() {
		return userCreate;
	}

	public void setUserCreate(String userCreate) {
		this.userCreate = userCreate;
	}

	public java.sql.Timestamp getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(java.sql.Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public String getUserUpdate() {
		return userUpdate;
	}

	public void setUserUpdate(String userUpdate) {
		this.userUpdate = userUpdate;
	}

	public java.sql.Timestamp getTimeUpdate() {
		return timeUpdate;
	}

	public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}
	
	
}
