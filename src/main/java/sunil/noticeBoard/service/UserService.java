package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.User;

import java.util.List;

@Service
public interface UserService {
    List<User> getAllUser();
    List<User> getUserByEmail(@Param("email") String email);
    List<User> getUserColumnByCondition(
            String columnName, String condition, String value
    );
    List<User> getUserByLogin(
            @Param("email") String email,
            @Param("password") String password
    );
    void insertUser(
            @Param("email") String email,
            @Param("name") String name,
            @Param("password") String password,
            @Param("phone") String phone
    );
    void updateUserProfile(String email, String content);
};
