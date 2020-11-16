package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Content;

import java.util.List;

public interface ContentMapper {
    List<Content> getAllContent();
    List<Content> getContentByEmail(String email);
    List<Content> getContentByContentName(String contentName);
    List<Content> getContentByCondition(String condition);
    void insertContent(Content content);
};
