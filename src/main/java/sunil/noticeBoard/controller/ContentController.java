package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import sunil.noticeBoard.service.ContentService;

@Controller
public class ContentController {
    @Autowired
    ContentService contentService;

    @GetMapping("/content/content-write")
    public String contentWrite() {
        return "/content/content_write";
    };
};
