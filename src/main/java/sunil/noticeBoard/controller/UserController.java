package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String profilePage(Model model, HttpServletRequest request, HttpSession session) {
        if(session.getAttribute("email") == null) {
            return "redirect:/user/account/logout";
        };

        String email = (String) request.getAttribute("email");
        String name = (String) request.getAttribute("name");
        String phone = (String) request.getAttribute("phone");

        model.addAttribute("email", email);
        model.addAttribute("name", name);
        model.addAttribute("phone", phone);

        return "user/profile";
    };

    @GetMapping("/user/account/duplicate_check")
    public String block() {
        return "redirect:/main";
    };
}
