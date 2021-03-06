package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Follow;

import java.util.List;

@Service
public interface FollowService {
    List<Follow> getFollower(@Param("email") String email);
    List<Follow> getFollowing(@Param("email") String email);
    Boolean getFollowWhether(
            @Param("follower") String follower,
            @Param("following") String following
    );

    void unfollow(
            @Param("email") String email,
            @Param("following") String following
    );
    void follow(
            @Param("email") String email,
            @Param("target") String target
    );
};
