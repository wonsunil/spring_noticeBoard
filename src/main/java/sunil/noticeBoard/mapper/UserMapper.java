package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.User;

import java.util.List;

public interface UserMapper {
    List<User> getAllUser();
    List<User> getUserByEmail(String email);
    List<User> getUserByName(String name);
    List<User> getUserColumnByCondition(String columnName, String condition, String value);
    List<User> getUserByLogin(String email, String password);

    void insertUser(String email, String name, String password, String phone);
    void updateUserProfile(String email, String content);
};
