package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.Follow;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.FollowService;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class RestUserController {
    @Autowired
    UserService userService;

    @Autowired
    FollowService followService;

    @GetMapping("/user/all-users")
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

    @GetMapping("/user/follower")
    public Follow[] getUserFollower(@RequestParam String email) {
        List<Follow> followerList = followService.getFollower(email);
        Follow[] followers = followerList.toArray(new Follow[0]);

        return followers;
    };

    @GetMapping("/user/following")
    public Follow[] getUserFollowing(@RequestParam String email) {
        List<Follow> followingList = followService.getFollowing(email);
        Follow[] following = followingList.toArray(new Follow[0]);

        return following;
    };

    @PostMapping("/user/profile/update")
    public Boolean updateUserProfile(HttpSession session, @RequestParam String content) {
        userService.updateUserProfile((String) session.getAttribute("email"), content);

        return true;
    };
};
