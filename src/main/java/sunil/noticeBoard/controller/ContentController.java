package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sunil.noticeBoard.Pagination;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.model.Likes;
import sunil.noticeBoard.model.User;
import sunil.noticeBoard.service.ContentService;
import sunil.noticeBoard.service.LikesService;
import sunil.noticeBoard.service.UserService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
public class ContentController {
    @Autowired
    UserService userService;

    @Autowired
    ContentService contentService;

    @Autowired
    LikesService likesService;

    Pagination page = MainController.page;

    @GetMapping("/content/content-write")
    public String contentWrite(HttpSession session) {
        if(session.getAttribute("email") != null) {
            return "/content/content_write";
        };

        return "redirect:/user/account/login";
    };

    @PostMapping("/content/content-write")
    public String insertContent(@RequestPart(value = "file", required = false) MultipartFile file, @RequestParam(value = "filename", required = false) String filename, @ModelAttribute Content content) {
        String writer = content.getWriter();

        List<Content> userWrittenContentList = contentService.getContentByEmail(writer);
        Content[] contents = userWrittenContentList.toArray(new Content[0]);

        int length = contents.length;

        var code = writer + "_" + (length+1);

        if(length > 1) {
            code = writer + "_" + (Integer.parseInt(contents[length-1].toArray()[4].substring(contents[length-1].toArray()[1].length()+1,
                    contents[length-1].toArray()[4].length())) + 1);
        };

        content.setContentCode(code);
        content.setLikes(0);
        content.setComments(0);

        contentService.insertContent(content);

        String path = "C:\\Users\\lee.changjun\\Desktop\\noticeBoard" +
                "\\src\\main\\resources\\static\\images\\content\\" + content.getContentCode();

        try {
            File dir = new File(path);
            String originFilename = file.getOriginalFilename();
            String extName
                    = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());

            if (!dir.isDirectory()) {
                dir.mkdir();
            };

            file.transferTo(new File(path + "\\" + filename + extName));

        } catch (IOException ignored) {}

        return "redirect:/content/content-write";
    };

    @GetMapping("/content/{contentCode}")
    public String showContentDetail(Model model, @PathVariable("contentCode") String contentCode) {
        List<Content> contentList = contentService.getContentByContentCode(contentCode);
        Content[] content = contentList.toArray(new Content[0]);

        model.addAttribute("content", content[0].toArray());
        model.addAttribute("page", page);

        File dir = new File("C:\\Users\\lee.changjun\\Desktop\\noticeBoard\\src\\main\\resources\\static\\images\\content\\" + content[0].toArray()[4]);
        String file = null;

        if(dir.isDirectory()) {
            String[] fileExts = {"jpg", "png", "gif"};

            for(String ext : fileExts) {
                File[] files = this.searchFile(dir, ext);

                if(files.length > 0) {
                    file = Arrays.toString(files)
                            .substring(
                                    Arrays.toString(files)
                                            .lastIndexOf("\\")+1,
                                    files[0]
                                            .toString()
                                            .length()+1
                            );
                    break;
                };
            }
        };

        String path = "/images/content/";

        model.addAttribute("imagePath", path + content[0].toArray()[4] + "/");
        model.addAttribute("file", file);

        return "/content/detail";
    };

    public File[] searchFile(File dir, String fileExt) {
        final String ext = fileExt.toLowerCase();
        File[] files = dir.listFiles(file1 -> {
            if (file1.isDirectory()) return false;

            return file1.getName().toLowerCase().endsWith("." + ext);
        });

        return files;
    }

    @GetMapping("/content/{contentCode}/likes")
    public String likes(Model model, @PathVariable("contentCode") String contentCode) {
        List<Content> contentList = contentService.getContentByContentCode(contentCode);
        Content[] content = contentList.toArray(new Content[0]);

        List<Likes> likesList = likesService.getLikes(contentCode);
        Likes[] likes = likesList.toArray(new Likes[0]);

        User[] users = new User[likes.length];

        for(int i = 0, length = likes.length; i < length; i++) {
            List<User> userList = userService.getUserByEmail(likes[i].toArray()[0]);

            users[i] = (User) userList.toArray()[0];
        }

        model.addAttribute("content", content[0].toArray());
        model.addAttribute("likes", likes);
        model.addAttribute("users", users);

        return "/content/detail";
    };

    @GetMapping("/content/search")
    public String search() {
        return "/content/search";
    };

    @GetMapping("/content/search/{contentName}")
    public String searchName(Model model, @PathVariable("contentName") String contentName) {
        List<Content> contentList = contentService.getSearchByContentName(contentName);

        model.addAttribute("contents", contentList.toArray(new Content[0]));
        model.addAttribute("service", likesService);

        return "/content/search";
    };

    @GetMapping("/content/like/{contentCode}")
    public String likeContent(HttpSession session, @PathVariable("contentCode") String contentCode) {
        String email = (String) session.getAttribute("email");

        if(email == null) return "redirect:/user/account/login";

        likesService.like(email, contentCode);

        return "redirect:/content/search";
    };

    @GetMapping("/content/unlike/{contentCode}")
    public String unlikeContent(HttpSession session, @PathVariable("contentCode") String contentCode) {
        String email = (String) session.getAttribute("email");

        if(email == null) return "redirect:/user/account/login";

        likesService.unlike(email, contentCode);

        return "redirect:/content/search";
    };
}
