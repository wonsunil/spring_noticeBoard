package sunil.noticeBoard.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sunil.noticeBoard.model.Member;
import sunil.noticeBoard.service.MemberService;

@RestController
@MapperScan(basePackages = "sunil.noticeBoard.mapper")
public class TestController {
    @Autowired
    MemberService memberService;

    @RequestMapping("/all")
    public Member getAllMember() {
        return (Member) memberService.getAllMember();
    }
}
