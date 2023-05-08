package stock_m.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.ManagementDao;
import stock_m.dto.ManagementDto;

@Service
public class ManagementService {
	
	@Autowired
	ManagementDao dao;
		
	public List<ManagementDto> managementList(int start){
		Map<String, Object> m =new HashMap<String,Object>();
		m.put("start", start);
		m.put("count", 5);
		return dao.managementList(m);
	}
	
	public List<ManagementDto> managementListSearch(String keyword,int start){
		Map<String,Object>m=new HashMap<String,Object>();
		m.put("keyword", keyword);
		m.put("start", start);
		m.put("count", 10);
		return dao.managementListSearch(m);
	}
	
	public int countSearch(String keyword) {
		Map<String,Object>m = new HashMap<String,Object>();
		m.put("keyword", keyword);
		return dao.countSearch(m);
	}
}