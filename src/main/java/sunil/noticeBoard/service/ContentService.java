package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Content;

import java.util.List;

@Service
public interface ContentService {
    List<Content> getAllContent();
    List<Content> getContentByEmail(@Param("email") String email);
    List<Content> getContentByContentName(@Param("contentName") String contentName);
    List<Content> getContentByCondition(@Param("condition") String condition);
    void insertContent(
            @Param("boardName") String notice_board,
            @Param("writer") String writer,
            @Param("contentName") String content_name,
            @Param("content") String content,
            @Param("code") String content_code,
            @Param("date") String updated_date,
            @Param("likes") int likes
    );

    // 게시글 고유 번호로 검색 필요하면 추가
};
