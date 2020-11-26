package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Likes;

import java.util.List;

public interface LikesMapper {
    List<Likes> getLikedByEmail(String email);
    List<Likes> getLikes(String contentCode);
    List<Likes> getLikeWhether(String email, String contentCode);

    void like(String email, String contentCode);
    void unlike(String email, String contentCode);
};
