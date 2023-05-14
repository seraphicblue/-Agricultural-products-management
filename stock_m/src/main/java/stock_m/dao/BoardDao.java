package stock_m.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import stock_m.dto.BoardDto;

@Mapper
public interface BoardDao {
	
    // 글 등록을 처리하는 메서드
    int insert(BoardDto dto);
    
    // 게시글 목록을 조회하는 메서드
    List<BoardDto> boardList(Map<String, Object> m);
    
    // 전체 글 갯수를 조회하는 메서드
    int count();
    
    // 특정 글을 조회하는 메서드
    BoardDto boardOne(int boardno);
    
    // 글을 수정하는 메서드
    int updateBoard(BoardDto dto);
    
    // 글을 삭제하는 메서드
    int deleteBoard(int boardno);
    
    // 특정 조건에 맞는 게시글 목록을 조회하는 메서드
    List<BoardDto> searchBoard(Map<String, Object> m);
}