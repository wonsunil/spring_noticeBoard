package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

        int length = contents.length;

        var code = writer + "_" + (length+1);

        if(length > 1) {
            code = writer + "_" + (Integer.parseInt(contents[length-1].toArray()[4].substring(contents[length-1].toArray()[4].length() -1))+1);
        };

        content.setContentCode(code);
        content.setLikes(0);

        contentService.insertContent(content);

        return "redirect:/content/content-write";
    };

    @GetMapping("/content/detail")
    public String showContentDetail(Model model, @RequestParam String contentName) {
        List<Content> contentList = contentService.getContentByContentName(contentName);
        Content[] content = contentList.toArray(new Content[0]);

        model.addAttribute("boardName", content[0].toArray()[0]);
        model.addAttribute("writer", content[0].toArray()[1]);
        model.addAttribute("contentName", content[0].toArray()[2]);
        model.addAttribute("content", content[0].toArray()[3]);
        model.addAttribute("code", content[0].toArray()[4]);
        model.addAttribute("updatedDate", content[0].toArray()[5]);

        return "/content/detail";
    };
}
