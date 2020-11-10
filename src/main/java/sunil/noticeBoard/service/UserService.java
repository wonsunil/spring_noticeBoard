package sunil.noticeBoard.service;

import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.User;

import java.util.List;

@Service
public interface UserService {
    List<User> getAllMember();
};
