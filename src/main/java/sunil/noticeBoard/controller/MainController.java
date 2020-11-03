package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String redirectMainPage() {
        return "redirect:http://localhost:8090/main";
    }

    @GetMapping("/main")
    public String goToMainPage() {
        return "main";
    }
}
