package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.mapper.MemberMapper;
import sunil.noticeBoard.model.Member;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;

    @Override
    public List<Member> getAllMember() {
        List<Member> member = mapper.getAllMember();

        return member;
    }
}
