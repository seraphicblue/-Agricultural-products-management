package stock_m.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import stock_m.dao.CommentDao;
import stock_m.dto.CommentDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    @Transactional
    public void createComment(CommentDto commentDto) {
        // 답글 생성
        commentDao.createComment(commentDto);
    }

    public List<CommentDto> commentList() {
        // 답글 목록 조회
    	Map<String, Object> m = new HashMap<String, Object>();
        return commentDao.commentList(m);
    }

    public CommentDto commentForm(int commentId) {
        // 답글 폼 조회
        return commentDao.commentForm(commentId);
    }
}
