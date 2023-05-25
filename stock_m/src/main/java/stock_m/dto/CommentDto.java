package stock_m.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {
    private int commentid;       // 답글 번호
    private int qnaboardid;      // 원본 게시글 번호
    private String userid;       // 작성자 ID
    private String content;      // 답글 내용
    private Date regdate;        // 등록일
}
