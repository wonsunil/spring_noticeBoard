package sunil.noticeBoard;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import sunil.noticeBoard.mapper.MemberMapper;
import sunil.noticeBoard.model.Member;
import sunil.noticeBoard.service.MemberService;

import java.util.List;

public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Test
    @Override
    public List<Member> getAllMember() {
        List<Member> member = (List<Member>) memberMapper.getAllMember();

        return member;
    }
}
