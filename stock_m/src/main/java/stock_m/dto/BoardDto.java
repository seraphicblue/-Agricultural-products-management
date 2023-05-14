package stock_m.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDto {
    private int boardno;        // 글 번호
    private String userid;      // 사용자 ID
    private String subject;     // 글 제목
    private String content;     // 글 내용
    private Date regdate;       // 등록일
    private int readcount;      // 조회수
}