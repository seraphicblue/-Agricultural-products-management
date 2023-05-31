package stock_m.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import stock_m.dto.CommentDto;
import stock_m.dto.QnABoardDto;
import stock_m.dto.UserDto;
import stock_m.service.CommentService;
import stock_m.service.QnABoardService;

import java.util.Date;
import java.util.List;

@SessionAttributes("user")
@Controller
public class QnABoardController {

    @Autowired
    QnABoardService service;
    @Autowired
    CommentService Cservice;

    // "user"��� �̸����� UserDto ��ü�� Model�� �߰��ϴ� �޼���
    @ModelAttribute("user")
    public UserDto getDto() {
        return new UserDto();
    }

    // �� �ۼ� ���� �����ִ� GET ��û ó�� �޼���
    @GetMapping("/normal/qnawrite")
    public String writeForm(@ModelAttribute("user") UserDto dto) {
        return "normal/qnawrite";
    }

    // �� �ۼ��� ó���ϴ� POST ��û ó�� �޼���
    @PostMapping("/normal/qnawrite")
    public String write(QnABoardDto dto) {
        service.qnainsert(dto);
        return "redirect:qnalist";
    }

    // �� ����� ��ȸ�ϴ� GET ��û ó�� �޼���
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

    // �� ������ �����ִ� GET ��û ó�� �޼���
    @GetMapping("/normal/qnacontent/{qnaboardid}")
    public String content(@PathVariable int qnaboardid, Model m) {
        service.qnaaddReadcount(qnaboardid);
        QnABoardDto dto = service.qnaboardOne(qnaboardid);
        m.addAttribute("dto", dto);
        List<CommentDto> commentList = Cservice.commentList();
        m.addAttribute("commentList", commentList);
        return "normal/qnacontent";
        
    }

    // �� ���� ���� �����ִ� GET ��û ó�� �޼���
    @GetMapping("/normal/qnaupdate/{qnaboardid}")
    public String qnaupdate(@PathVariable int qnaboardid, Model m) {
        QnABoardDto dto = service.qnaboardOne(qnaboardid);
        m.addAttribute("dto", dto);
        return "normal/qnaupdate";
    }
    

    // �� ������ ó���ϴ� PUT ��û ó�� �޼���
    @PostMapping("/normal/qnaupdate")
    public String qnaupdate(QnABoardDto dto) {
        service.qnaupdateBoard(dto);
        return "redirect:/normal/qnalist";
    }

    // �� ������ ó���ϴ� DELETE ��û ó�� �޼���
    @DeleteMapping("/normal/qnadelete/{qnaboardid}")
    @ResponseBody
    public String qnadelete(@PathVariable int qnaboardid) {
        // ��û �Ķ���ͷ� ���޹��� �� ��ȣ�� ����Ͽ� service�� qnadeleteBoard �޼��带 ȣ���Ͽ� �� ����
        int i = service.qnadeleteBoard(qnaboardid);
        // ������ ���� ���� ���ڿ��� ��ȯ
        return String.valueOf(i);
    }

}