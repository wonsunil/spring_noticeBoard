package sunil.noticeBoard.model;

public class Member {
    private String email;
    private String name;
    private String password;
    private String phone;
    private String rank;

    public String getEmail() {
        return email;
    };
    public String getName() {
        return name;
    };
    public String getPhone() {
        return phone;
    };
    public String getRank() {
        return rank;
    };

    public void setEmail(String eamil) {
        this.email = email;
    };
    public void setName(String name) {
        this.name = name;
    };
    public void setPassword(String password) {
        this.password = password;
    };
    public void setPhone(String phone) {
        this.phone = phone;
    };
    public void setRank(String rank) {
        this.rank = rank;
    };
};
