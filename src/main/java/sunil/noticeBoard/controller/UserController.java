package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @GetMapping("/user/account/login")
    public String goToLoginPage() {
        return "user/account/login";
    };

    @GetMapping("/user/account/register")
    public String goToRegisterPage() {
        return "user/account/register";
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
