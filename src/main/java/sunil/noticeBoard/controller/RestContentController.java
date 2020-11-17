package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;

import java.util.List;

@RestController
public class RestContentController {
    @Autowired
    ContentService contentService;

    @GetMapping("/content/align-content")
    public Content[] getContents(@RequestParam String contentName) {
        List<Content> contentList = contentService.getSearchByContentName(contentName);
        Content[] contents = contentList.toArray(new Content[0]);

        return contents;
    };

    @GetMapping("/content/user-content")
    public Content[] userContentByEmail(@RequestParam String email) {
        List<Content> contentList = contentService.getContentByEmail(email);
        Content[] contents = contentList.toArray(new Content[0]);

        return contents;
    };

    @GetMapping("/content/user-content-name")
    public Content[] userContentByContentName(@RequestParam String contentName) {
        List<Content> contentList = contentService.getSearchByContentName(contentName);
        Content[] contents = contentList.toArray(new Content[0]);

        return contents;
    };

    @PostMapping("/content/rewrite")
    public Boolean rewriteContent(@ModelAttribute Content content) {
        contentService.rewriteContent(content);

        return true;
    };

    @DeleteMapping("/content/delete")
    public Boolean deleteContent(@ModelAttribute Content content) {
        contentService.insertBackupContent(content);
        contentService.deleteContent(content);

        return true;
    };

    @GetMapping("/content/search")
    public Content[] searchContent(String contentName) {
        List<Content> contentList = contentService.getSearchByContentName(contentName);

        return contentList.toArray(new Content[0]);
    };
};
