/*
   Date    : 2023.05.15
   name    : RevenueController
   type    : Controller
   ver     : 1.1
   connect  : confirm.jsp,rbuy.jsp,total.jsp
   content : 판매,구매내역 장부관리 컨트롤러
   writer  : 이이지
   api     : x
  */
package stock_m.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import java.util.function.Predicate;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.server.MimeMappings.Mapping;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

import stock_m.dto.BuyDto;
import stock_m.dto.RevenueDto;
import stock_m.dto.SellDto;
import stock_m.dto.StockDto;
import stock_m.service.RevenueService;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class RevenueController {
	@Autowired
	RevenueService service;
 
	  @GetMapping("/company/sellinsert") 
	  public String sellwrite(HttpSession session ,@Param("pno")String pno ,@Param("price")int price, @Param("scount") int scount) {
		  String userid = (String)session.getAttribute("userid");
		  service.sellinsert(userid,pno,price,scount); 
	  return "redirect:/company/confirm"; }
	  
	  @GetMapping("/company/buyinsert") 
	  public String buywrite(HttpSession session ,@Param("pno")String pno ,@Param("price")int price, @Param("bcount") int bcount) {
		  String userid = (String)session.getAttribute("userid");
		  service.buyinsert(userid,pno,price,bcount); 
	  return "redirect:/company/confirm"; }
	
	//@ModelAttribute("user") MemDto dto) {//1.세션서장값 dto 에넘겨줌 2. 파라미터값 저장(id는 그대로) sesssion에 저장되 내용 바뀜=>db도업데이트 해줘야함
	//dto에 아이디값은 포함되지않았음

	  @RequestMapping("company/confirm")
		public String list(HttpSession session,@RequestParam(name="p", defaultValue = "1") int page, Model m ) {
		  String userid = (String)session.getAttribute("userid");
			//글이 있는지 체크
			int count = service.count();//글갯수
			
			if(count > 0) {
				
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;//0부터시작하기 때문에 1뺌
			
			
			  List<SellDto> rlist = service.selectOne(userid); 
			  m.addAttribute("rlist",rlist);
			  
			  List<Map<String, Object>> totalList = service.totalList(userid); 
			m.addAttribute("totalList", totalList);
		
			int pageNum = 5;//보여질 페이지 번호수
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			
			}
		
			m.addAttribute("count", count);
			
			return "company/confirm";
		}
	  	
		  @GetMapping("/company/rdelete")
		  @ResponseBody
		   public void delete(@RequestParam("bno") int bno) {
			  System.out.println(bno);
			  service.deleteRef(bno);	
			  
			  }
		  
		  @GetMapping("/company/rcheckdelete")
		  public String rcheckdelete(@RequestParam("selectedItems[]") int[] selectedItems) {
		    for (int selectedItem : selectedItems) {
		      int sno = selectedItem;
		      System.out.println(sno);
		      service.deleteRef(sno);
		    }
		    return "redirect:/company/confirm";
		  }
		  

		  
			
			
			//@ModelAttribute("user") MemDto dto) {//1.세션서장값 dto 에넘겨줌 2. 파라미터값 저장(id는 그대로) sesssion에 저장되 내용 바뀜=>db도업데이트 해줘야함
			//dto에 아이디값은 포함되지않았음
		  @RequestMapping("/company/rsell")
		  @ResponseBody
			public String rselllist(HttpSession session ) {
		
			  String userid = (String)session.getAttribute("userid");
				 
				  List<Map<String, Object>> sellList = service.sellList(userid); 
				  Gson gson=new Gson();
				  String rlist =gson.toJson(sellList);				
				  System.out.println("rlist:::"+rlist);
				return rlist;
			}
		  	
			  @GetMapping("/company/revselldel")
			   public String revselldel(@RequestParam int sno) {
				  System.out.println(sno);
				  service.deletesell(sno);	
				  System.out.println("this");
				  return "/company/confirm";
				  }
			  
			  @GetMapping("/company/revsellcheckdel")
			  public String revsellcheckdel(@RequestParam("selectedItems[]") int[] selectedItems) {
				  
				  
			    for (int selectedItem : selectedItems) {
			      int sno = selectedItem;
			     
			      System.out.println(sno);
			      service.deletesell(sno);
			    }
			    return "redirect:/company/rsell";
			  }
			  
			  @GetMapping("/company/revmixdel")
			  public String revsellcheckdel(@RequestParam("selectedItems[]") int[] selectedItems,@RequestParam("kind[]") String[] kind) {
				  
				  for (String k: kind) {
				      
				      System.out.println("kind"+k);
				      //service.deletesell(sno);
				      for (int selectedItem : selectedItems) {
					      int no = selectedItem;
					     
					      System.out.println(no);
					      service.deletemix(k,no);
					    }
				    }
			   
			    
			    return "redirect:/company/rsell";
			  }
			  @RequestMapping("/company/rbuy")
			  @ResponseBody
				public String rbuylist(HttpSession session,Model m ) {
			
				  String userid = (String)session.getAttribute("userid");
					 
					  List<Map<String, Object>> rbuyList = service.rbuyList(userid); 
					  Gson gson=new Gson();
					  String rlist =gson.toJson(rbuyList);				
					  System.out.println(rlist);
					return rlist;
				}
			  	
				  @GetMapping("/company/revbuydel")
				   public String revbuydel(@RequestParam int bno) {
					  System.out.println(bno);
					  service.deleteRef(bno);	
					  System.out.println("this");
					  return "/company/rbuy";
					  }
				  
				  @GetMapping("/company/revbuycheckdel")
				  public String revbuycheckdel(@RequestParam("selectedItems[]") int[] selectedItems) {

				    for (int selectedItem : selectedItems) {
				      int bno = selectedItem;
				      System.out.println(bno);
				      service.deleteRef(bno);
				    }
				    return "redirect:/company/rbuy";
				  }
				  

					@GetMapping("/company/revbuyupdate")
					public String updateForm(List<BuyDto> dto ,Model m) {
				             service.rbuyupdate(dto);
						     m.addAttribute("dto",dto);
						return "redirect:/company/rbuy";
					}
		
					
					  @RequestMapping("/company/total")
					  @ResponseBody
						public String totallist(HttpSession session,Model m ) {
						 System.out.println("totallist실행");
						 String userid = (String)session.getAttribute("userid");
						  
						 
						List<Map<String, Object>> totalList = service.totalList(userid); 
						  Gson gson=new Gson();
						  String rlist =gson.toJson(totalList);				
						  System.out.println("total"+rlist);
						return rlist;
					  }
						  @GetMapping("company/rsearch")
						  public String searchrcontent(String search,Model m) {
							  System.out.println(search);
	                         
							  
							  List<StockDto> sList=service.searchrcontent(search);
							  m.addAttribute("stockList",sList);
							  m.addAttribute("search", search);
							 
						   return "/company/search";
						 
						}	
						  
							
					//chart
						
					
					  @GetMapping("company/cr") public String chartr(HttpSession session,Model m) {
					  String userid = (String) session.getAttribute("userid"); return"company/cr";
					  }
					 
						
						
						@GetMapping("company/getsdate")
						@ResponseBody
						public ResponseEntity<String> getsdate(HttpSession session,@RequestParam("start-date") String startDate,
                                @RequestParam("end-date") String endDate)throws JsonProcessingException{
							
							String userid = (String) session.getAttribute("userid");
							
							List<Map<String, Object>> filteredData = service.getFilteredData(startDate, endDate ,userid);
							List<Map<String, Object>> buyData =service.getbuyData(startDate, endDate, userid);
							List<Map<String, Object>> totalData=service.gettotalData(startDate, endDate, userid);
							
							System.out.println(filteredData);
							System.out.println(buyData);
							System.out.println(totalData);
							
							//json으로 직렬화
							ObjectMapper om= new ObjectMapper();
                            
							//json문자열로 변환
							String filteredDataJson = om.writeValueAsString(filteredData);
							String buyDataJson = om.writeValueAsString(buyData);
							String totalDataJson = om.writeValueAsString(totalData);

							Map<String, String> responseData = new HashMap<>();
							responseData.put("filteredData", filteredDataJson);
							responseData.put("buyData", buyDataJson);
							responseData.put("totalData", totalDataJson);
							
							String jsonResponse = om.writeValueAsString(responseData);
							
							return ResponseEntity.ok(jsonResponse);
							
						}
						
						@GetMapping("company/getmain")
						@ResponseBody
						 public  ResponseEntity<String> getmain(HttpSession session)throws JsonProcessingException {
							String userid = (String)session.getAttribute("userid");
							List<Map<String, Object>> getmainselldata = service.getmainselldata(userid);
							List<Map<String, Object>> getmainbuydata = service.getmainbuydata(userid);
							
							System.out.println("getmain"+getmainselldata);
							System.out.println("getmainbuy"+getmainbuydata);
							ObjectMapper om= new ObjectMapper();
							
							String sellDataJson = om.writeValueAsString(getmainselldata);
							String buyDataJson = om.writeValueAsString(getmainbuydata);
							
							Map<String, String> responseData = new HashMap<>();
							responseData.put("sellData", sellDataJson);
							responseData.put("buyData", buyDataJson);
							
							String jsonResponse = om.writeValueAsString(responseData);
							
							return ResponseEntity.ok(jsonResponse);
						}
						
						 

						
}