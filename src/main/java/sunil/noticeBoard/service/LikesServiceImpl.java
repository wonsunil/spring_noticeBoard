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
    public List<Likes> getLikes(String contentCode) {
          return mapper.getLikes(contentCode);
    };
};
