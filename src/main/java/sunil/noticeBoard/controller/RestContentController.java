package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;

import java.util.List;

@RestController
public class RestContentController {
    @Autowired
    ContentService contentService;

    @GetMapping("/content/align-content")
    public Content[] getContents(@RequestParam String condition) {
        List<Content> contentList = contentService.getContentByCondition(condition);
        Content[] contents = contentList.toArray(new Content[0]);

        return contents;
    };

    @GetMapping("/content/user-content")
    public Content[] userContent(@RequestParam String email) {
        List<Content> contentList = contentService.getContentByEmail(email);
        Content[] contents = contentList.toArray(new Content[0]);

        return contents;
    };
};
