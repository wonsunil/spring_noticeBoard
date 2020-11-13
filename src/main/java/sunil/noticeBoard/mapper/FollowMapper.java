package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Follow;

import java.util.List;

public interface FollowMapper {
    List<Follow> getFollower(String email);
    List<Follow> getFollowing(String email);
};