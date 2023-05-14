package stock_m.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import stock_m.dto.BoardDto;
import stock_m.dto.UserDto;
import stock_m.service.BoardService;
import java.util.List;

@SessionAttributes("user")
@Controller
public class BoardController {

    @Autowired
    BoardService service;
    
    // "user"라는 이름으로 UserDto 객체를 Model에 추가하는 메서드
    @ModelAttribute("user")
    public UserDto getDto() {
        return new UserDto();
    }

    // 글 작성 폼을 보여주는 GET 요청 처리 메서드
    @GetMapping("/normal/write")
    public String writeForm(@ModelAttribute("user")UserDto dto) {
        return "normal/write";// normal/write 템플릿을 반환하여 글 작성 폼을 보여줌
    }
    
    // 글 작성을 처리하는 POST 요청 처리 메서드
    @PostMapping("/normal/write")
    public String write(BoardDto dto) {
        service.insert(dto);// 전달받은 글 데이터를 데이터베이스에 저장
        return "redirect:list";  // 글 작성 후 글 목록 페이지로 리다이렉트
    }
    
    // 글 목록을 조회하는 GET 요청 처리 메서드
    @GetMapping("/normal/list")
    public String list(@RequestParam(name = "p", defaultValue = "1") int page,
            @RequestParam(name = "field", required = false) String field,
            @RequestParam(name = "keyword", required = false) String keyword,
            Model m)  {

 
        int count = service.count(); // 전체 글 갯수 조회
        if(count > 0) {

        int perPage = 10; // 한 페이지에 보일 글의 갯수
        int startRow = (page - 1) * perPage;

        List<BoardDto> boardList;
        // 검색어가 있을 경우 검색 조건에 따라 게시글을 검색
        if (keyword != null && !keyword.isEmpty()) {
            boardList = service.searchBoard(field, keyword, startRow);
        } else {
            boardList = service.boardList(startRow); // 해당 페이지에 맞는 글 목록 조회

        }

        m.addAttribute("bList", boardList);

        int pageNum = 5;  // 페이징에 보여줄 페이지 번호의 갯수
        int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

        int begin = (page - 1) / pageNum * pageNum + 1; // 시작 페이지 번호
        int end = begin + pageNum - 1;  // 끝 페이지 번호c
        if (end > totalPages) {
            end = totalPages;
        }
        m.addAttribute("begin", begin);
        m.addAttribute("end", end);
        m.addAttribute("pageNum", pageNum);
        m.addAttribute("totalPages", totalPages);

        }
        m.addAttribute("count", count);
        return "normal/list";// normal/list 템플릿을 반환하여 글 목록을 보여줌
    }

 // 글 내용을 보여주는 GET 요청 처리 메서드
    @GetMapping("normal/content/{boardno}")
    public String content(@ModelAttribute("user") UserDto user, @PathVariable int boardno, Model m) {
        // 요청 URL에서 {boardno}에 해당하는 글 번호를 받아옴
        // 해당 글 번호를 사용하여 service의 boardOne 메서드를 호출하여 해당 글의 정보를 가져옴
        BoardDto dto = service.boardOne(boardno);
        // 가져온 글 정보를 Model에 추가하여 뷰로 전달
        m.addAttribute("dto", dto);
        // normal/content 템플릿을 반환하여 해당 글의 내용을 보여줌
        return "normal/content";
    }

    // 글 수정 폼을 보여주는 GET 요청 처리 메서드
    @GetMapping("normal/update/{boardno}")
    public String updateForm(@PathVariable int boardno, Model m) {
        // 요청 URL에서 {boardno}에 해당하는 글 번호를 받아옴
        // 해당 글 번호를 사용하여 service의 boardOne 메서드를 호출하여 해당 글의 정보를 가져옴
        BoardDto dto = service.boardOne(boardno);
        // 가져온 글 정보를 Model에 추가하여 뷰로 전달
        m.addAttribute("dto", dto);
        // normal/updateform 템플릿을 반환하여 해당 글의 수정 폼을 보여줌
        return "normal/updateform";
    }

    // 글 수정을 처리하는 PUT 요청 처리 메서드
    @PutMapping("/normal/update")
    public String update(BoardDto dto) {
        // 전달받은 수정된 글 정보를 service의 updateBoard 메서드를 호출하여 업데이트
        service.updateBoard(dto);
        // 글 수정 후 글 목록 페이지로 리다이렉트
        return "redirect:list";
    }

    // 글 삭제를 처리하는 DELETE 요청 처리 메서드
    @DeleteMapping("/normal/delete")
    @ResponseBody
    public String delete(int boardno) {
        // 요청 파라미터로 전달받은 글 번호를 사용하여 service의 deleteBoard 메서드를 호출하여 글 삭제
        int i = service.deleteBoard(boardno);
        // 삭제된 글의 수를 문자열로 반환
        return "" + i;
    }
}