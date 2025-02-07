package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Footer;

public interface FooterDAO {
	
	public void save(Footer footer) throws Exception;
	public void update(Footer footer) throws Exception;
    public void delete(Footer footer) throws Exception;
    

    public List<Map< String, Object>> findAll() throws Exception;

	public Footer findById(Integer footer_id) throws Exception;
	public Footer findById(String parent_footer_id) throws Exception;
	
	Integer getMaxId() throws Exception;
	List<Map<String, Object>> findParentIdByFooterId(Integer footer_id) throws Exception;
	boolean checkExistByName(String footer_name);
	public boolean hasChildFooters(String footerId);
	public boolean deleteById(String footerId);
	List<Map<String, Object>> findByFooterName(String footerName) throws Exception;
	
	List<Footer> findParent() throws Exception;
	List<Map<String, Object>> findAllChildFooter() throws Exception;
}
