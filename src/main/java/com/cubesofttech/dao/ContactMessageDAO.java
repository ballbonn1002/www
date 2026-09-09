package com.cubesofttech.dao;

import com.cubesofttech.model.ContactMessage;

public interface ContactMessageDAO {

	void save(ContactMessage message) throws Exception;
}
