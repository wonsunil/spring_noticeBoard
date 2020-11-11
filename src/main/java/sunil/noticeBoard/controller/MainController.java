package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import sunil.noticeBoard.DataList;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    DataList dataList = new DataList();

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:/main";
    };

    @GetMapping("/main")
    public String goToMainPageGet(Model model, HttpSession session) throws SQLException {
        String email = (String) session.getAttribute("email");

        if(email != null) {
            List<Content> writtenContentList = contentService.getContentByEmail(email);
            Content[] writtenContentArray = writtenContentList.toArray(new Content[0]);

            model.addAttribute("writtenContentArray", writtenContentArray);
        };

        List<Content> allContentList = contentService.getAllContent();
        Content[] allContentArray = allContentList.toArray(new Content[allContentList.size()]);

        model.addAttribute("allContentArray", allContentArray);

        return "main";
    };
}
