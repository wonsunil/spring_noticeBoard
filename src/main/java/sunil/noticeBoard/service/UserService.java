package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.User;

import java.util.List;

@Service
public interface UserService {
    List<User> getAllUser();
    List<User> getUserByEmail(@Param("email")String email);
    List<User> getUserColumnByCondition(
            @Param("columnName")String columnName,
            @Param("condition")String condition,
            @Param("value")String value
    );
};
