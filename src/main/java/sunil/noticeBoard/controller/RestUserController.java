package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpServletRequest;
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

    @PostMapping("/user/account/duplicate_check")
    public Boolean emailDuplicateCheck(HttpServletRequest request) {
        String email = request.getParameter("email");

        List<User> userList = userService.getUserByEmail(email);
        User[] user = userList.toArray(new User[0]);

        if(user.length > 0) {
            return false;
        };

        return true;
    };
};
