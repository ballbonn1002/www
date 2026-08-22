package com.cubesofttech.model;

import java.io.Serializable;
import java.util.List;

// Parsed from Job.requirementsJson; any list may be empty if a posting lacks that section.
public class JobRequirements implements Serializable {

	private List<String> responsibilities;
	private List<String> requiredQualifications;
	private List<String> requiredSkills;
	private List<String> preferredQualifications;
	private List<String> preferredSkills;

	public List<String> getResponsibilities() {
		return responsibilities;
	}

	public void setResponsibilities(List<String> responsibilities) {
		this.responsibilities = responsibilities;
	}

	public List<String> getRequiredQualifications() {
		return requiredQualifications;
	}

	public void setRequiredQualifications(List<String> requiredQualifications) {
		this.requiredQualifications = requiredQualifications;
	}

	public List<String> getRequiredSkills() {
		return requiredSkills;
	}

	public void setRequiredSkills(List<String> requiredSkills) {
		this.requiredSkills = requiredSkills;
	}

	public List<String> getPreferredQualifications() {
		return preferredQualifications;
	}

	public void setPreferredQualifications(List<String> preferredQualifications) {
		this.preferredQualifications = preferredQualifications;
	}

	public List<String> getPreferredSkills() {
		return preferredSkills;
	}

	public void setPreferredSkills(List<String> preferredSkills) {
		this.preferredSkills = preferredSkills;
	}
}
