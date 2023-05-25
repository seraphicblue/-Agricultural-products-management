package stock_m.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock_m.dao.QnABoardDao;

import stock_m.dto.QnABoardDto;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnABoardService {
    @Autowired
    QnABoardDao dao;

    // 게시글 수 조회
    public int count() {
        return dao.count();
    }

    // 특정 범위의 게시글 목록 조회


    // 특정 조건에 맞는 게시글 목록 검색

    // 게시글 등록
    public int qnainsert(QnABoardDto dto) {
        return dao.qnainsert(dto);
    }

    // 특정 게시글 조회
    public QnABoardDto qnaboardOne(int qnaboardid) {
        return dao.qnaboardOne(qnaboardid);
    }

    // 게시글 수정
    public int qnaupdateBoard(QnABoardDto dto) {
        return dao.qnaupdateBoard(dto);
    }

    // 게시글 삭제
    public int qnadeleteBoard(int qnaboardid) {
        return dao.qnadeleteBoard(qnaboardid);
    }


    // Q&A 게시판 목록 조회
    public List<QnABoardDto> qnaboardsList(int start) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("start", start);
        m.put("count", 10);
        // Q&A 게시판에 특화된 조회 로직을 작성하세요.
        // 예: m.put("category", "Q&A");
        return dao.qnaboardList(m);
    }

    // Q&A 게시판 검색
    public List<QnABoardDto> qnaboardsSearch(String field, String keyword, int start, Date startDate, Date endDate) {
        Map<String, Object> m = new HashMap<String, Object>();
        m.put("field", field);
        m.put("keyword", keyword);
        m.put("start", start);
        m.put("count", 10);
        m.put("startDate", startDate);
        m.put("endDate", endDate);
        return dao.qnasearchBoard(m);
    }

	public int qnaaddReadcount(int qnaboardid) {
		return dao.qnaaddReadcount(qnaboardid);
		// TODO Auto-generated method stub
		
	}
}
