package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;

import javax.servlet.http.HttpServletRequest;
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
    public String insertContent(HttpServletRequest request) {
        String boardName = request.getParameter("boardName");
        String writer = request.getParameter("writer");
        String contentName = request.getParameter("contentName");
        String content = request.getParameter("content");
        String date = request.getParameter("date");

        List<Content> userWrittenContentList = contentService.getContentByEmail(writer);
        Content[] contents = userWrittenContentList.toArray(new Content[0]);
        String code = writer + "_" + (contents.length+1);

        contentService.insertContent(boardName, writer, contentName, content, code, date, 0);

        return "redirect:/content/content-write";
    };
};
