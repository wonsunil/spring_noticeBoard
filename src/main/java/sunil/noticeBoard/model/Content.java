package sunil.noticeBoard.model;

public class Content {
    private String notice_board;
    private String writer;
    private String content_name;
    private String content;
    private String content_code;
    private String updated_date;
    private int likes;
    private String deleted_date;

    public String getNoticeBoard() {
        return notice_board;
    };
    public String getWriter() {
        return writer;
    };
    public String getContentName() {
        return content_name;
    };
    public String getContent() {
        return content;
    };
    public String getContentCode() {
        return content_code;
    };
    public String getUpdatedDate() {
        return updated_date;
    };
    public int getLikes() {
        return likes;
    };
    public String getDeleted_date() {
        return deleted_date;
    };

    public void setNoticeBoard(String noticeBoard) {
        this.notice_board = noticeBoard;
    };
    public void setWriter(String writer) {
        this.writer = writer;
    };
    public void setContentName(String contentName) {
        this.content_name = contentName;
    };
    public void setContent(String content) {
        this.content = content;
    };
    public void setContent_code(String content_code) {
        this.content_code = content_code;
    };
    public void setUpdatedDate(String date) {
        this.updated_date = date;
    };
    public void setLikes(int likes) {
        this.likes = likes;
    };
    public void setDeleted_date(String date) {
        this.deleted_date = date;
    };

    public String[] toArray() {
        String[] contentArray = {notice_board, writer, content_name, content, content_code, updated_date, String.valueOf(likes), deleted_date};

        return contentArray;
    };
};
