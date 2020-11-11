package sunil.noticeBoard.mapper;

import sunil.noticeBoard.model.Comment;

import java.util.List;

public interface CommentMapper {
    List<Comment> getAllComments(String contentCode);
    List<Comment> getCommentsByCommentCode(String contentCode, String commentCode);
};
