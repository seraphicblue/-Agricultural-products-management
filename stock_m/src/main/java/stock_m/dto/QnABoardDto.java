package stock_m.dto;

import java.util.Date;

import lombok.Data;
 @Data
 
public class QnABoardDto {
	 
    private int qnaboardid;        // 글 번호
    private String userid;      // 사용자 ID
    private String subject;     // 글 제목
    private String content;     // 글 내용
    private Date regdate;       // 등록일
    private int readcount;      // 조회수
    private boolean secret;
    private String role;
    // 생성자, Getter 및 Setter 메소드

    // 추가적인 필드나 메소드들을 작성할 수 있습니다.
}