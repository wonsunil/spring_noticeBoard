package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Likes;

import java.util.List;

public interface LikesMapper {
    List<Likes> getLikes(String contentCode);
};
