package sunil.noticeBoard.model;

public class Content {
    private String notice_board;
    private String writer;
    private String content_name;
    private String content;
    private String content_code;

    public String getBoardName() {
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
    public String getContent_code() {
        return content_code;
    };

    public void setBoardName(String boardName) {
        this.notice_board = boardName;
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

    public String[] toArray() {
        String[] contentArray = {this.notice_board, this.writer, this.content_name, this.content, this.content_code};

        return contentArray;
    };
};
