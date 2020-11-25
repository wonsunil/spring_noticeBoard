package sunil.noticeBoard.model;

public class Likes {
    private String contentCode;
    private String email;

    public String getEmail() {
        return email;
    };

    public void setContentCode(String code) {
        this.contentCode = code;
    };
    public void setEmail(String email) {
        this.email = email;
    };

    public String[] toArray() {
        return new String[]{this.email, this.contentCode};
    };
};
