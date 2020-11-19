package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.UserService;
import sunil.noticeBoard.service.ContentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    @GetMapping("/user/account/login")
    public String goToLoginPageGet(HttpSession session) {
        String email = (String) session.getAttribute("email");

        if(email != null)
            return "redirect:/main";

        return "user/account/login";
    };

    @PostMapping("/user/account/login")
    public String goToLoginPagePost(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        List<User> userList = userService.getUserByLogin(email, password);
        User[] user = userList.toArray(new User[0]);

        if (user.length > 0) {
            try{
                session.setAttribute("email", user[0].toArray()[0]);
                session.setAttribute("name", user[0].toArray()[1]);
                session.setAttribute("phone", user[0].toArray()[2]);
                session.setAttribute("rank", user[0].toArray()[3]);

            } catch(ArrayIndexOutOfBoundsException ignored) {

            };

            return "redirect:/main";
        };

        return "redirect:/user/account/login";
    };

    @GetMapping("/user/account/register")
    public String registerPage() {
        return "user/account/register";
    };

    @PostMapping("/user/account/register")
    public String register(HttpServletRequest request) {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        userService.insertUser(email, name, password, phone);

        return "redirect:/main";
    };

    @GetMapping("/user/account/logout")
    public String logout(HttpSession session) {
        session.setAttribute("email", null);
        session.setAttribute("name", null);
        session.setAttribute("phone", null);
        session.setAttribute("rank", null);

        return "redirect:/main";
    };

    @GetMapping("/user/profile")
    public String profilePage(Model model, @RequestParam String email) {
        List<User> userList = userService.getUserByEmail(email);
        User[] user = userList.toArray(new User[0]);

        model.addAttribute("user", user[0].toArray());

        List<Content> contentList = contentService.getContentByEmail(email);
        Content[] contents = contentList.toArray(new Content[0]);

        model.addAttribute("contents", contents);

        return "user/profile";
    };

    @GetMapping("/user/account/duplicate_check")
    public String block() {
        return "redirect:/main";
    };
}
