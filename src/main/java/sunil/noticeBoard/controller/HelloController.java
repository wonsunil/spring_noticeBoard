package sunil.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/index")
    public String index(Model moddel) {
        moddel.addAttribute("test", "success");
        return "index";
    };

    @GetMapping("/register")
    public String hello(Model model) {
        model.addAttribute("name", "test");
        return "register";
    };
}