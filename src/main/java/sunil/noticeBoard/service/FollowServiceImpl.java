package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import sunil.noticeBoard.mapper.FollowMapper;
import sunil.noticeBoard.model.Follow;

import java.util.List;

public class FollowServiceImpl implements FollowService {
    @Autowired
    FollowMapper mapper;

    @Override
    public List<Follow> getFollower(String email) {
        return mapper.getFollower(email);
    };

    @Override
    public List<Follow> getFollowing(String email) {
        return mapper.getFollowing(email);
    };
};
