package stock_m.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import stock_m.dto.QnABoardDto;

@Mapper
public interface QnABoardDao {

    // 글 등록을 처리하는 메서드
    int qnainsert(QnABoardDto dto);
    
    // 게시글 목록을 조회하는 메서드
    
    
    // 전체 글 갯수를 조회하는 메서드
    int count();
    
    // 특정 글을 조회하는 메서드
    QnABoardDto qnaboardOne(int qnaboardid);
    
    // 글을 수정하는 메서드
    int qnaupdateBoard(QnABoardDto dto);
    
    // 글을 삭제하는 메서드
    int qnadeleteBoard(int qnaboardid);
    
    // 특정 조건에 맞는 게시글 목록을 조회하는 메서드


    // Q&A 게시판 목록을 조회하는 메서드
    List<QnABoardDto> qnaboardList(Map<String, Object> m);

    // Q&A 게시판에서 특정 조건에 맞는 게시글 목록을 조회하는 메서드
    List<QnABoardDto> qnasearchBoard(Map<String, Object> m);

    // Q&A 게시판에서 특정 조건에 맞는 게시글 목록을 날짜로 검색하는 메서드
    List<QnABoardDto> qnasearchDateBoard(Map<String, Object> m);



	int qnaaddReadcount(int qnaboardid);
}

