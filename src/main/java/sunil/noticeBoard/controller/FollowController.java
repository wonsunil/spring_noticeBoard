package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import sunil.noticeBoard.service.FollowService;

import javax.servlet.http.HttpSession;

@Controller
public class FollowController {
    @Autowired
    FollowService followService;

    @GetMapping("/user/unfollow/{following}")
    public String unfollow(@PathVariable("following") String following, HttpSession session) {
        followService.unfollow((String) session.getAttribute("email"), following);

        return "redirect:/user/search";
    };
}
