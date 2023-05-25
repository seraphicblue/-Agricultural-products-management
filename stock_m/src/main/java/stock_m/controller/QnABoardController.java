package stock_m.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import stock_m.dto.QnABoardDto;
import stock_m.dto.UserDto;

import stock_m.service.QnABoardService;

import java.util.Date;
import java.util.List;

@SessionAttributes("user")
@Controller
public class QnABoardController {

    @Autowired
    QnABoardService service;

    // "user"라는 이름으로 UserDto 객체를 Model에 추가하는 메서드
    @ModelAttribute("user")
    public UserDto getDto() {
        return new UserDto();
    }

    // 글 작성 폼을 보여주는 GET 요청 처리 메서드
    @GetMapping("/normal/qnawrite")
    public String writeForm(@ModelAttribute("user") UserDto dto) {
        return "normal/qnawrite";
    }

    // 글 작성을 처리하는 POST 요청 처리 메서드
    @PostMapping("/normal/qnawrite")
    public String write(QnABoardDto dto) {
        service.qnainsert(dto);
        return "redirect:qnalist";
    }

    // 글 목록을 조회하는 GET 요청 처리 메서드
    @GetMapping("/normal/qnalist")
    public String list(@RequestParam(name = "p", defaultValue = "1") int page,
                       @RequestParam(name = "field", required = false) String field,
                       @RequestParam(name = "keyword", required = false) String keyword,
                       @RequestParam(name = "startDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                       @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
                       Model m) {
   

        int count = service.count();
        if (count > 0) {
            int perPage = 10;
            int startRow = (page - 1) * perPage;

            List<QnABoardDto> qnaboardList;
            if (keyword != null && !keyword.isEmpty() || (startDate != null && endDate != null)) {
                qnaboardList = service.qnaboardsSearch(field, keyword, startRow, startDate, endDate);
            } else {
                qnaboardList = service.qnaboardsList(startRow);
            }



            m.addAttribute("bList", qnaboardList);

            int pageNum = 5;
            int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

            int begin = (page - 1) / pageNum * pageNum + 1;
            int end = begin + pageNum - 1;
            if (end > totalPages) {
                end = totalPages;
            }
            m.addAttribute("begin", begin);
            m.addAttribute("end", end);
            m.addAttribute("pageNum", pageNum);
            m.addAttribute("totalPages", totalPages);
        }

        m.addAttribute("count", count);
        System.out.println(count);
        return "normal/qnalist";
    }

    // 글 내용을 보여주는 GET 요청 처리 메서드
    @GetMapping("/normal/qnacontent/{qnaboardid}")
    public String content(@PathVariable int qnaboardid, Model m) {
        service.qnaaddReadcount(qnaboardid);
        QnABoardDto dto = service.qnaboardOne(qnaboardid);
        m.addAttribute("dto", dto);
        return "normal/qnacontent";
    }

    // 글 수정 폼을 보여주는 GET 요청 처리 메서드
    @GetMapping("/normal/qnaupdate/{qnaboardid}")
    public String qnaupdate(@PathVariable int qnaboardid, Model m) {
        QnABoardDto dto = service.qnaboardOne(qnaboardid);
        m.addAttribute("dto", dto);
        return "normal/qnaupdate";
    }

    // 글 수정을 처리하는 PUT 요청 처리 메서드
    @PutMapping("/normal/qnaupdate")
    public String qnaupdate(QnABoardDto dto) {
        service.qnaupdateBoard(dto);
        return "redirect:/normal/qnalist";
    }

    // 글 삭제를 처리하는 DELETE 요청 처리 메서드
    @DeleteMapping("/normal/qnadelete/{qnaboardid}")
    @ResponseBody
    public String qnadelete(@PathVariable int qnaboardid) {
        // 요청 파라미터로 전달받은 글 번호를 사용하여 service의 qnadeleteBoard 메서드를 호출하여 글 삭제
        int i = service.qnadeleteBoard(qnaboardid);
        // 삭제된 글의 수를 문자열로 반환
        return String.valueOf(i);
    }

}