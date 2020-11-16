package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;

import java.util.List;

@Controller
public class ContentController {
    @Autowired
    ContentService contentService;

    @GetMapping("/content/content-write")
    public String contentWrite() {
        return "/content/content_write";
    };

    @PostMapping("/content/content-write")
    public String insertContent(@ModelAttribute Content content) {
        String writer = content.getWriter();

        List<Content> userWrittenContentList = contentService.getContentByEmail(writer);
        Content[] contents = userWrittenContentList.toArray(new Content[0]);
        String code = writer + "_" + (contents.length+1);

        content.setContent_code(code);
        content.setLikes(0);

        contentService.insertContent(content);

        return "redirect:/content/content-write";
    };
};
