package sunil.noticeBoard.model;

public class Comments {
    private String email;
    private String content_code;
    private String comment_content;
    private String comment_code;

    public String getEmail() {
        return this.email;
    };
    public String getContentCode() {
        return this.content_code;
    };
    public String getCommentContent() {
        return this.comment_content;
    };
    public String getCommentCode() {
        return this.comment_code;
    };

    public void setEmail(String email) {
        this.email = email;
    };
    public void setCommentContent(String content) {
        this.comment_content = content;
    };
};
