package sunil.noticeBoard.service;

import org.apache.ibatis.annotations.Param;
import sunil.noticeBoard.model.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> getAllComments(@Param("contentCode") String contentCode);
    List<Comment> getCommentsByCommentCode(
            @Param("contentCode") String contentCode,
            @Param("commentCode") String commentCode
    );

};
