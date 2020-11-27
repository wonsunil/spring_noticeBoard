package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import sunil.noticeBoard.Pagination;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.model.Follow;
import sunil.noticeBoard.service.UserService;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.FollowService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    @Autowired
    FollowService followService;

    public static Pagination page = new Pagination();

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:/main";
    };

    @GetMapping("/main")
    public String goToMainPageGet(Model model, HttpSession session, @RequestParam(value = "page", required = false) String currentPage) {
        String email = (String) session.getAttribute("email");

        if(email != null) {
            List<Follow> followerList = followService.getFollower(email);
            List<Follow> followingList = followService.getFollowing(email);

            model.addAttribute("follower", followerList.toArray(new Follow[0]));
            model.addAttribute("following", followingList.toArray(new Follow[0]));
        };

        List<Content> allContentList = contentService.getAllContent();
        Content[] allContentArray = allContentList.toArray(new Content[0]);

        int allContentsLength = allContentArray.length;
        int count = allContentsLength / page.getLimit();

        page.setLastPage(count);

        if((allContentsLength % 10) != 0) page.setLastPage(count + 1);
        if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));

        if(page.getCurrentPage() == 1) page.setStartIndex(1);
        else page.setStartIndex((page.getCurrentPage() - 1) * page.getLimit() + 1);

        page.setLastIndex(page.getCurrentPage() * page.getLimit() + 1);

        model.addAttribute("allContentArray", allContentArray);
        model.addAttribute("paging", page);

        return "main";
    };

    @GetMapping("/pagination/set/{limit}")
    public String setLimit(@PathVariable(value = "limit") int limit) {
        page.setLimit(limit);

        return "redirect:/main?page=1";
    };
}
