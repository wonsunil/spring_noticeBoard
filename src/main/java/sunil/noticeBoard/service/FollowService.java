package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import sunil.noticeBoard.model.Follow;

import java.util.List;

public interface FollowService {
    List<Follow> getFollower(@Param("email") String email);
    List<Follow> getFollowing(@Param("email") String email);
};
