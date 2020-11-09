package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.DataList;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
public class MainController {
    DataList dataList = new DataList();

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String goToMainPageGet(Model model, HttpSession session) throws SQLException {
        String email = (String) session.getAttribute("email");
        String sql = "SELECT WRITER FROM CONTENT_INFO WHERE WRITER='"+email+"'";
        String sql2 = "SELECT ID FROM COMMENTS WHERE ID='"+email+"'";
        String sql3 = "select ID FROM LIKES WHERE ID='"+email+"'";

        String[] contentWriterList = dataList.getList(sql, new String[0]);
        model.addAttribute("contentWriterList", contentWriterList);

        String[] commentWriterList = dataList.getList(sql2, new String[0]);
        model.addAttribute("commentWriterList", commentWriterList);

        String[] likeContentsList = dataList.getList(sql3, new String[0]);
        model.addAttribute("likeContentsList", likeContentsList);

        return "main";
    };

    @PostMapping("/main")
    public String goToMainPagePost() {
        return "main";
    };
}
