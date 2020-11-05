package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String goToMainPageGet() {
        return "main";
    };

    @PostMapping("/main")
    public String goToMainPagePost() {
        return "main";
    };
}
