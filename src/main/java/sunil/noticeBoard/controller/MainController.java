package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sunil.noticeBoard.Pagination;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    public static Pagination page = new Pagination();

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:/main";
    };

    @GetMapping("/main")
    public String goToMainPageGet(Model model, HttpSession session, @RequestParam(value = "page", required = false) String currentPage) {
        String email = (String) session.getAttribute("email");

        if(email != null) {
            List<Content> writtenContentList = contentService.getContentByEmail(email);
            Content[] writtenContentArray = writtenContentList.toArray(new Content[0]);

            model.addAttribute("writtenContentArray", writtenContentArray);
        };
        List<Content> allContentList = contentService.getAllContent();
        Content[] allContentArray = allContentList.toArray(new Content[0]);

        int allContentsLength = allContentArray.length;

        page.setRange(allContentsLength);

        if((allContentsLength % 10) != 0)
            page.setLastPage((int) (Math.floor(allContentsLength / 10) + 1));

        if(allContentsLength % 10 == 0)
            page.setLastPage((int) Math.floor(allContentsLength / 10));

        if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));

        if(page.getCurrentPage() == 1) page.setStartIndex(0);
        if(page.getCurrentPage() > 1)
            page.setStartIndex((page.getCurrentPage() - 1) * 10);

        page.setLastIndex(page.getCurrentPage() * page.getLimit());

        model.addAttribute("allContentArray", allContentArray);
        model.addAttribute("paging", page);
        return "main";
    };
}
