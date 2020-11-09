package sunil.noticeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.Member;
import sunil.noticeBoard.service.MemberService;

@RestController
public class TestController {
    @Autowired
    MemberService memberService;

    @RequestMapping("/all")
    public Member getAllMember() {
        return (Member) memberService.getAllMember();
    }
}
