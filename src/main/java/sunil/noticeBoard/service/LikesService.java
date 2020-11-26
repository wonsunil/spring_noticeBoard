package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Likes;

import java.util.List;

@Service
public interface LikesService {
    List<Likes> getLikedByEmail(String email);
    List<Likes> getLikes(String contentCode);

    Boolean getLikeWhether(
            @Param("email") String email,
            @Param("contentCode") String contentCode
    );

    void like(
            @Param("email") String email,
            @Param("contentCode") String contentCode
    );
    void unlike(
            @Param("email") String email,
            @Param("contentCode") String contentCode
    );
};
