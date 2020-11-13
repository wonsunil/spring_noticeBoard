package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Follow;

import java.util.List;

@Service
public interface FollowService {
    List<Follow> getFollower(@Param("email") String email);
    List<Follow> getFollowing(@Param("email") String email);
};
