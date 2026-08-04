package com.cubesofttech.model;

/**
 * Plain POJO, not a @Entity - there is no DB table for this yet
 * (CareersAction currently builds these from a hardcoded mock list).
 * Field shape is intentionally what a future "testimonial" table row
 * would look like, so swapping the mock list for a real DAO call later
 * needs no JSP changes.
 */
public class Testimonial {

	private String name;
	private String position;
	private String quote;
	private String avatarSrc;

	public Testimonial(String name, String position, String quote, String avatarSrc) {
		this.name = name;
		this.position = position;
		this.quote = quote;
		this.avatarSrc = avatarSrc;
	}

	public String getName() {
		return name;
	}

	public String getPosition() {
		return position;
	}

	public String getQuote() {
		return quote;
	}

	public String getAvatarSrc() {
		return avatarSrc;
	}
}
