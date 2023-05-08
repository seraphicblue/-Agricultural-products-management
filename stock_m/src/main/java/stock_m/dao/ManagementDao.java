package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import stock_m.dto.ManagementDto;

@Mapper
public interface ManagementDao {

		int count();
		List<ManagementDto>managementList(Map<String,Object> m);
		List<ManagementDto>managementListSearch(Map<String,Object> m);
		int countSearch(Map<String,Object> m);

}