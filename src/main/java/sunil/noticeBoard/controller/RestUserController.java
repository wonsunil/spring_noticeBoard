package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.UserService;

import java.util.List;

@RestController
public class RestUserController {
    @Autowired
    UserService userService;

    @GetMapping("/getAllUser")
    public List<User> getAllUser() {
        List<User> userList = userService.getAllUser();

        return userList;
    };
};
