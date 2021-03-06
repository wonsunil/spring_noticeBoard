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
    List<Content> getContentByContentCode(@Param("contentCode") String contentCode);
    List<Content> getSearchByContentName(@Param("contentName") String contentName);
    void insertContent(Content content);
    void insertBackupContent(Content content);
    void rewriteContent(Content content);
    void deleteContent(Content content);
};
