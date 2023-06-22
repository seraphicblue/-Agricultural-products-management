
/*
   Date    : 2023.05.15
   name    : RevenueDao
   type    : Dao
   ver     : 1.1
   connect  : RevenueService
   content : 판매,구매내역 장부관리 dao
   writer  : 이이지
   api     : x
  */
package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import stock_m.dto.BuyDto;
import stock_m.dto.RevenueDto;
import stock_m.dto.SellDto;
import stock_m.dto.StockDto;

@Mapper
public interface RevenueDao {

	// userid의 현재 잔고를 확인
	@Select("select profit from revenue where userid =#{userid}")
	int checks(String userid);

	// userid의 정보를 가지고 장부 테이블의 잔고를 업데이트
	@Update("UPDATE revenue SET profit=profit-#{s_price} WHERE userid = #{userid}")
	int updater(@Param("s_price") int s_price, @Param("userid") String userid);

	// 구매가 이루어진다면 해당 param 값들을 이용해 저장
	@Insert("insert into buy(pno,userid,bdate,price,bcount) values(#{ano},#{userid},#{s_date},#{s_price},#{s_volume})")
	int insertb(@Param("ano") int ano, @Param("userid") String userid, @Param("s_date") String s_date,
			@Param("s_price") int s_price, @Param("s_volume") int s_volume);

	@Insert("insert into sell (sno,userid,pno,sdate,price,scount) values(#{sno},#{userid},#{pno},#{sdate},#{price},#{scount})")
	int insert(SellDto dto);

	@Select("select * from revenue where userid = #{userid}") // 글번호가 같다면 전부 select
	List<SellDto> selectOne(String userid);

	@Update("update sell set pno=#{pno}, price=#{price} where sno=#{sno} ")
	int updateRefOne(Map<String, Integer> snomap);

	@Delete("delete from buy where bno = #{bno}")
	int deleteRef(@RequestParam int bno);

	@Select("select * from revenue where userid = #{userid} order by rno ")
	List<RevenueDto> boardList(Map<String, Object> m);// start,count desc limit #{start} , #{count}

	@Select("select count(*) from sell")
	int count();

	@Insert("insert into sell (sno, pno, userid,sdate,price,scount) values(#{sno}, #{pno}, #{userid}, now(),#{price} #{scount}")
	int rinsert(BuyDto dto);

	@Select("select s.sno,p.pname,DATE_FORMAT(s.sdate, \"%Y/%m/%d\")as sdate,s.price,s.scount from sell s,product p where s.pno=p.pno and userid=#{userid} order by s.sdate desc, s.sno desc")
	List<Map<String, Object>> sellList(String userid);

	@Select("select * from sell where sno = #{sno}") // 글번호가 같다면 전부 select
	SellDto selectsell(int sno);

	// 구매//main코드 수정 23.05.23

	@Insert("insert into buy (bno, pno, userid, bdate, price) values(#{bno}, #{pno}, #{userid}, now(), #{price})")
	int rbuyinsert(BuyDto dto);

	@Select("select bno, acontent,DATE_FORMAT(bdate, \"%Y/%m/%d\") as bdate,price,bcount from (select * from buy where userid=#{userid}) a inner join adminstock on a.pno =adminstock.ano order by bdate desc, pno desc;")
	List<Map<String, Object>> rbuyList(String userid);

	@Update("update buy set price=#{price} where bno=#{bno}")
	int rbuyupdate(List<BuyDto> dto);

	@Update("update sell set price=#{price} where sno=#{sno}")
	int updatesell(List<SellDto> dto);

	@Insert("insert into sell (userid,pno,price,sdate,scount) values(#{userid},#{pno},#{price},now(),#{scount})")
	int sellinsert(Map<String, Object> m);

	@Insert("insert into buy (userid,pno,price,bdate,bcount) values(#{userid},#{pno},#{price},now(),#{bcount})")
	int buyinsert(Map<String, Object> m);

	@Select("select pname from product, buy where buy.pno=product.pno and buy.pno={pno}")
	String selectpname(int pno);

	@Delete("delete from sell where sno=#{sno}")
	int deletesell(int sno);

	@Select("SELECT s.sno AS no, p.pname, DATE_FORMAT(s.sdate, \"%Y/%m/%d\") AS 'date', p.price, s.scount AS count, '판매' AS kind FROM sell s INNER JOIN product p ON s.pno = p.pno WHERE s.userid = #{userid}"
			+ " UNION"
			+ " SELECT a.bno AS no, adminstock.acontent, DATE_FORMAT(a.bdate, \"%Y/%m/%d\") AS 'date', a.price, a.bcount AS count, '구매' AS kind FROM buy a INNER JOIN adminstock ON a.pno = adminstock.ano"
			+ " WHERE a.userid = #{userid}" + " ORDER BY date DESC, no DESC;")
	List<Map<String, Object>> totalList(String userid);

	@Select("select *from sell,buy where pname=#{search}")
	List<StockDto> searchrcontent(String search);

	@Select("select count(*) from buy")
	int countb();

	// chart
	@Select("SELECT MONTH(sdate) AS month, SUM(price) AS sell_price FROM sell WHERE userid=#{userid} and sdate BETWEEN #{startDate} AND #{endDate} GROUP BY MONTH(sdate) order by MONTH(sdate)")
	List<Map<String, Object>> getFilteredData(Map<String, Object> m);

	@Select("SELECT MONTH(bdate) AS month, SUM(price) AS buy_price FROM buy WHERE userid=#{userid} and bdate BETWEEN #{startDate} AND #{endDate} GROUP BY MONTH(bdate) order by MONTH(bdate)")
	List<Map<String, Object>> getbuyData(Map<String, Object> m);

	@Select("SELECT s.month, (s.total_price - b.total_price) AS profit FROM"
			+ "  (SELECT MONTH(sdate) AS month, SUM(price) AS total_price FROM sell WHERE userid=#{userid} and sdate BETWEEN  #{startDate} AND #{endDate} GROUP BY MONTH(sdate) order by MONTH(sdate)) AS s "
			+ "JOIN "
			+ "  (SELECT MONTH(bdate) AS month, SUM(price) AS total_price FROM buy WHERE userid=#{userid} and bdate BETWEEN  #{startDate} AND #{endDate} GROUP BY MONTH(bdate) order by MONTH(bdate)) AS b "
			+ "ON s.month = b.month")
	List<Map<String, Object>> gettotalData(Map<String, Object> m);

	@Select("select sum(bcount) as bc, bdate from buy where userid=#{userid} group by bdate")
	List<Map<String, Object>> getmainbuydata(String userid);

	@Select("select sum(scount) as sc, sdate from sell where userid=#{userid} group by sdate")
	List<Map<String, Object>> getmainselldata(String userid);

	@Select("select sum(bcount) as bc, bdate from buy group by bdate")
	List<Map<String, Object>> getmainbuydata2();

	@Select("select sum(scount) as sc, sdate from sell group by sdate")
	List<Map<String, Object>> getmainselldata2();

}
