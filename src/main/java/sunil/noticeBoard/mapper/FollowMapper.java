package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Follow;

import java.util.List;

public interface FollowMapper {
    List<Follow> getFollower(String email);
    List<Follow> getFollowing(String email);
    List<Follow> getFollowWhether(String follower, String following);

    void unfollow(String email, String following);
    void follow(String email, String target);
};
