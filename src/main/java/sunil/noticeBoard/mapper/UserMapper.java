package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.User;

import java.util.List;

public interface UserMapper {
    User selectMemberByEmail(String Email);

    List<User> getAllMember();

    void insertMemberData(User member);
};
