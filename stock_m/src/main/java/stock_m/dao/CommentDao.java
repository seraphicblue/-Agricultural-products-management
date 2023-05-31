package stock_m.dao;


import org.apache.ibatis.annotations.Mapper;
import java.util.Map;
import stock_m.dto.CommentDto;

import java.util.List;

@Mapper
public interface CommentDao {

    // 답글 생성

    void createComment(CommentDto commentDto);

    // 답글 목록 조회

    List<CommentDto> commentList(Map<String, Object> m);

    // 답글 폼 조회

    CommentDto commentForm(int qnaboardid);
}
