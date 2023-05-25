package stock_m.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import stock_m.dao.BoardDao;
import stock_m.dto.BoardDto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardDao dao;

    // 게시글 수 조회
    public int count() {
        return dao.count();
    }

    // 특정 범위의 게시글 목록 조회
    public List<BoardDto> boardList(int start) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("start", start);
        m.put("count", 10);
        return dao.boardList(m);
    }
    // 특정 조건에 맞는 게시글 목록 검색
    public List<BoardDto> searchDateBoard(String field, String keyword, int start, Date startDate, Date endDate) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("field", field);
        m.put("keyword", keyword);
        m.put("start", start);
        m.put("count", 10);
        m.put("startDate", startDate);
        m.put("endDate", endDate);
        return dao.searchDateBoard(m);
    }    
    public List<BoardDto> searchBoard(String field, String keyword, int start) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("field", field);
        m.put("keyword", keyword);
        m.put("start", start);
        m.put("count", 10);
        return dao.searchBoard(m);
    }

    // 게시글 등록
    public int insert(BoardDto dto) {
        return dao.insert(dto);
    }

    // 특정 게시글 조회
    public BoardDto boardOne(int boardno) {
        return dao.boardOne(boardno);
    }

    // 게시글 수정
    public int updateBoard(BoardDto dto) {
        return dao.updateBoard(dto);
    }

    // 게시글 삭제
    public int deleteBoard(int boardno) {
        return dao.deleteBoard(boardno);
    }
    public int addReadcount(int boardno) {
    	return dao.addReadcount(boardno);
    }


}