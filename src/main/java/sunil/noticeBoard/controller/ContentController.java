package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.model.Likes;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.LikesService;

import java.util.List;

@Controller
public class ContentController {
    @Autowired
    ContentService contentService;

    @Autowired
    LikesService likesService;

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
            code = writer + "_" + (Integer.parseInt(contents[length-1].toArray()[4].substring(contents[length-1].toArray()[4].length() - 1))+1);
        };

        content.setContentCode(code);
        content.setLikes(0);
        content.setComments(0);

        contentService.insertContent(content);

        return "redirect:/content/content-write";
    };

    @GetMapping("/content/{contentCode}")
    public String showContentDetail(Model model, @PathVariable String contentCode) {
        List<Content> contentList = contentService.getContentByContentCode(contentCode);
        Content[] content = contentList.toArray(new Content[0]);

        model.addAttribute("content", content[0].toArray());

        return "/content/detail";
    };

    @GetMapping("/content/{contentCode}/likes")
    public String likes(Model model, @PathVariable("contentCode") String contentCode) {
        List<Likes> likesList = likesService.getLikes(contentCode);
        Likes[] likes = likesList.toArray(new Likes[0]);

        model.addAttribute("likes", likes);

        return "/content/detail";
    };
}
