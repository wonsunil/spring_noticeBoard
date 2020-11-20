package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.model.Likes;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.LikesService;
import sunil.noticeBoard.service.UserService;

import java.util.List;

@Controller
public class ContentController {
    @Autowired
    UserService userService;

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
    public String showContentDetail(Model model, @PathVariable("contentCode") String contentCode) {
        List<Content> contentList = contentService.getContentByContentCode(contentCode);
        Content[] content = contentList.toArray(new Content[0]);

        model.addAttribute("content", content[0].toArray());

        return "/content/detail";
    };

    @GetMapping("/content/{contentCode}/likes")
    public String likes(Model model, @PathVariable("contentCode") String contentCode) {
        List<Content> contentList = contentService.getContentByContentCode(contentCode);
        Content[] content = contentList.toArray(new Content[0]);

        List<Likes> likesList = likesService.getLikes(contentCode);
        Likes[] likes = likesList.toArray(new Likes[0]);

        User[] users = new User[likes.length];

        for(int i = 0, length = likes.length; i < length; i++) {
            List<User> userList = userService.getUserByEmail(likes[i].toArray()[0]);

            users[i] = (User) userList.toArray()[0];
        }

        model.addAttribute("content", content[0].toArray());
        model.addAttribute("likes", likes);
        model.addAttribute("users", users);

        return "/content/detail";
    };
}
