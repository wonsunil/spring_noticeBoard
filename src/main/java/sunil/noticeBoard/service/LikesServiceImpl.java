package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sunil.noticeBoard.mapper.LikesMapper;
import sunil.noticeBoard.model.Likes;

import java.util.List;

@Service
public class LikesServiceImpl implements LikesService{
    @Autowired
    LikesMapper mapper;

    @Override
    public List<Likes> getLikedByEmail(String email) {
        return mapper.getLikedByEmail(email);
    };

    @Override
    public List<Likes> getLikes(String contentCode) {
          return mapper.getLikes(contentCode);
    };

    @Override
    public Boolean getLikeWhether(String email, String contentCode) {
        List<Likes> likeList = mapper.getLikeWhether(email, contentCode);
        Likes[] likeArray = likeList.toArray(new Likes[0]);

        return likeArray.length != 0;
    };
};
