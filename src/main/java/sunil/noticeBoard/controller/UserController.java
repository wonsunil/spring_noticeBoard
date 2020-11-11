package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/user/account/login")
    public String goToLoginPageGet() {
        return "user/account/login";
    };

    @PostMapping("/user/account/login")
    public String goToLoginPagePost(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        List<User> userList = userService.getUserByLogin(email, password);
        User[] user = userList.toArray(new User[0]);

        String url = "/user/account/login";

        if (user != null) {
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
    public String goToRegisterPageGet() {


        return "user/account/register";
    };

    @PostMapping("/user/account/register")
    public String goToRegisterPagePost() {
        return "user/account/register";
    };

    @GetMapping("/user/account/logout")
    public String goToMain(HttpSession session) {
        session.setAttribute("email", null);
        session.setAttribute("name", null);
        session.setAttribute("phone", null);
        session.setAttribute("rank", null);

        return "redirect:/main";
    };

    @GetMapping("/user/profile")
    public String goToProfilePage() {
        return "user/profile";
    };

    @GetMapping("/user/account/duplicate_check")
    public String goToDuplicateCheck() {
        return "user/account/duplicateCheck";
    };

    @PostMapping("/user/account/duplicate_check")
    public String goToDuplicateCheck2() {
        return "user/account/duplicateCheck";
    };
}
