package stock_m.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import stock_m.dto.CommentDto;
import stock_m.dto.QnABoardDto;
import stock_m.dto.UserDto;
import stock_m.service.CommentService;
import stock_m.service.QnABoardService;

@Controller

public class CommentController {

    @ModelAttribute("user")
    public UserDto getDto() {
        return new UserDto();
    }

    @Autowired
    CommentService service;
    @Autowired
    QnABoardService Qservice;
    
    @GetMapping("normal/comment/{qnaboardid}")
    public String commentList(@PathVariable("qnaboardid") int qnaboardid, Model m) {
        QnABoardDto parentDto = Qservice.qnaboardOne(qnaboardid);
        m.addAttribute("qnaboardid", qnaboardid);
        m.addAttribute("qna", parentDto);
        return "normal/comment";
    }	
    
    @PostMapping("normal/comment/{qnaboardid}")
    public String commentSubmit(@PathVariable("qnaboardid") int qnaboardid, CommentDto dto) {
        // 부모 글의 정보를 가져와 답글의 필요한 정보를 설정
        QnABoardDto parentDto = Qservice.qnaboardOne(qnaboardid);

        dto.setUserid(parentDto.getUserid());
        service.createComment(dto);
        
        return "redirect:../qnacontent/{qnaboardid}" ;
    }
}
