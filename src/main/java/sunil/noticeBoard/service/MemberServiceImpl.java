package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import sunil.noticeBoard.mapper.MemberMapper;
import sunil.noticeBoard.model.Member;

import java.util.List;

public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public List<Member> getAllMember() {
        List<Member> member = (List<Member>) memberMapper.getAllMember();

        return member;
    }
}
