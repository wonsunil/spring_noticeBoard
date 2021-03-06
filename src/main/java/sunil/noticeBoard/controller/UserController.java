package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.model.Follow;
import sunil.noticeBoard.model.Likes;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.FollowService;
import sunil.noticeBoard.service.LikesService;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    @Autowired
    FollowService followService;

    @Autowired
    LikesService likesService;

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
                session.setAttribute("image", user[0].toArray()[5]);
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

    @GetMapping("/user/profile/{email}")
    public String profilePage(Model model, @PathVariable String email) {
        List<User> userList = userService.getUserByEmail(email);
        User[] user = userList.toArray(new User[0]);

        model.addAttribute("user", user[0].toArray());

        List<Content> contentList = contentService.getContentByEmail(email);
        Content[] contents = contentList.toArray(new Content[0]);

        model.addAttribute("contents", contents);

        List<Follow> followerList = followService.getFollower(email);
        List<Follow> followingList = followService.getFollowing(email);

        model.addAttribute("follower", followerList.toArray(new Follow[0]));
        model.addAttribute("following", followingList.toArray(new Follow[0]));

        List<Likes> likedList = likesService.getLikedByEmail(email);

        model.addAttribute("likedContents", likedList.toArray(new Likes[0]));

        model.addAttribute("page", MainController.page);

        return "user/profile";
    };

    @GetMapping("/user/profile/{email}/follower")
    public String follower(Model model, @PathVariable("email") String email) {
        List<User> userList = userService.getUserByEmail(email);
        List<Follow> followerList = followService.getFollower(email);

        model.addAttribute("user", userList.toArray(new User[0])[0].toArray());
        model.addAttribute("follower", followerList.toArray(new Follow[0]));
        model.addAttribute("page", MainController.page);

        return "user/profile";
    };

    @GetMapping("/user/profile/{email}/following")
    public String following(Model model, @PathVariable("email") String email) {
        List<User> userList = userService.getUserByEmail(email);
        List<Follow> followingList = followService.getFollowing(email);

        model.addAttribute("user", userList.toArray(new User[0])[0].toArray());
        model.addAttribute("following", followingList.toArray(new Follow[0]));
        model.addAttribute("page", MainController.page);

        return "user/profile";
    };

    @GetMapping("/user/account/duplicate_check")
    public String block() {
        return "redirect:/main";
    };

    @GetMapping("/user/search")
    public String search() {
        return "/user/search";
    };

    @GetMapping("/user/search/email/{email}")
    public String searchEmail(Model model, @PathVariable("email") String email) {
        List<User> userList = userService.getUserByEmail(email);

        model.addAttribute("user", userList.toArray(new User[0]));

        return "/user/search";
    };
    @GetMapping("/user/search/name/{name}")
    public String searchName(Model model, @PathVariable("name") String name) {
        List<User> userList = userService.getUserByName(name);

        model.addAttribute("user", userList.toArray(new User[0]));
        model.addAttribute("service", followService);

        return "/user/search";
    };
}
