package sunil.noticeBoard.service;

import org.springframework.stereotype.Service;
import sunil.noticeBoard.model.Likes;

import java.util.List;

@Service
public interface LikesService {
    List<Likes> getLikedByEmail(String email);
    List<Likes> getLikes(String contentCode);
};
