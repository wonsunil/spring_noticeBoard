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
    List<Content> getSearchByContentName(@Param("contentName") String contentName);
    void insertContent(Content content);
    void rewriteContent(String content, String date, String code);

    // 게시글 고유 번호로 검색 필요하면 추가
};
