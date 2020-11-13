package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.mapper.ContentMapper;
import sunil.noticeBoard.model.Content;

import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private ContentMapper mapper;

    @Override
    public List<Content> getAllContent() {
        List<Content> allContentList = mapper.getAllContent();

        return allContentList;
    };

    @Override
    public List<Content> getContentByEmail(String email) {
        List<Content> contentList = mapper.getContentByEmail(email);

        return contentList;
    };

    @Override
    public List<Content> getContentByContentName(String contentName) {
        List<Content> contentList = mapper.getContentByContentName(contentName);

        return contentList;
    };

    @Override
    public List<Content> getContentByCondition(String condition) {
        return mapper.getContentByCondition(condition);
    };

    @Override
    public void insertContent(String boardName, String writer, String contentName, String content, String code, String date, int likes) {
        mapper.insertContent(boardName, writer, contentName, content, code, date, likes);
    };
};
