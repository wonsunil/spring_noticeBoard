package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Content;

import java.util.List;

public interface ContentMapper {
    List<Content> getAllContent();
    List<Content> getContentByEmail(String email);
    List<Content> getContentByContentName(String contentName);
    List<Content> getSearchByContentName(String contentName);
    void insertContent(Content content);
    void rewriteContent(String content, String date, String code);
    void deleteContent(Content content);
};
