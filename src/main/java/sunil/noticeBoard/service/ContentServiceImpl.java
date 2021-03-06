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
    public List<Content> getContentByContentCode(String contentCode) {
        List<Content> contentList = mapper.getContentByContentCode(contentCode);

        return contentList;
    };

    @Override
    public List<Content> getSearchByContentName(String contentName) {
        return mapper.getSearchByContentName(contentName);
    };

    @Override
    public void insertContent(Content content) {
        mapper.insertContent(content);
    };

    @Override
    public void insertBackupContent(Content content) {
        mapper.insertBackupContent(content);
    };

    @Override
    public void rewriteContent(Content content) {
        mapper.rewriteContent(content);
    };

    @Override
    public void deleteContent(Content content) {
        mapper.deleteContent(content);
    };
};
