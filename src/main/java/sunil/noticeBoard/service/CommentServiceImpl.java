package sunil.noticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import sunil.noticeBoard.mapper.CommentMapper;
import sunil.noticeBoard.model.Comment;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper mapper;

    @Override
    public List<Comment> getAllComments(String contentCode) {
        List<Comment> commentsList = mapper.getAllComments(contentCode);

        return commentsList;
    };

    @Override
    public List<Comment> getCommentsByCommentCode(String contentCode, String commentCode) {
        List<Comment> commentList = mapper.getCommentsByCommentCode(contentCode, commentCode);

        return commentList;
    };
};
