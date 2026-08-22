package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Footer;

public interface FooterDAO {

	List<Footer> findParent() throws Exception;
	List<Map<String, Object>> findAllChildFooter() throws Exception;
}
