package sunil.noticeBoard.service;

import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Member;

import java.util.List;

@Service
public interface MemberService {
    List<Member> getAllMember();
};
