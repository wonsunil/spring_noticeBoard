package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/user/account/login")
    public String goToLoginPage() {
        return "user/account/login";
    }

    @GetMapping("/user/account/register")
    public String goToRegisterPage() {
        return "user/account/register";
    }

    @GetMapping("/user/profile")
    public String goToProfilePage() {
        return "user/profile";
    }
}
