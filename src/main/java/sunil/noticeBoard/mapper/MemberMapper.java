package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Member;

import java.util.List;

public interface MemberMapper {
    Member selectMemberByEmail(String Email);

    List<Member> getAllMember();

    void insertMemberData(Member member);
};
