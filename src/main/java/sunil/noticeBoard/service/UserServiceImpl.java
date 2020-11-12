package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.mapper.UserMapper;
import sunil.noticeBoard.model.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper mapper;

    @Override
    public List<User> getAllUser() {
        List<User> userList = mapper.getAllUser();

        return userList;
    };

    @Override
    public List<User> getUserByEmail(String email) {
        List<User> user = mapper.getUserByEmail(email);

        return user;
    };

    @Override
    public List<User> getUserColumnByCondition(
            String columnName, String condition, String value
    ) {
        List<User> userColumnData = mapper.getUserColumnByCondition(columnName, condition, value);

        return userColumnData;
    };

    @Override
    public List<User> getUserByLogin(String email, String password) {
        List<User> user = mapper.getUserByLogin(email, password);

        return user;
    };

    @Override
    public void insertUser(String email, String name, String password, String phone) {
        mapper.insertUser(email, name, password, phone);
    };
}
