package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.mapper.FollowMapper;
import sunil.noticeBoard.model.Follow;

import java.util.List;

@Service
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

    @Override
    public Boolean getFollowWhether(String follower, String following) {
        List<Follow> followingList = mapper.getFollowWhether(follower, following);
        Follow[] followArray = followingList.toArray(new Follow[0]);

        return followArray.length != 0;
    };

    @Override
    public void unfollow(String email, String following) {
        mapper.unfollow(email, following);
    };
};
