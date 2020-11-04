package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public void goToMainPagePost(Model model, String userEmail) {
        if(userEmail != null) {
            model.addAttribute("userEmail", userEmail);
        };
    };
}
