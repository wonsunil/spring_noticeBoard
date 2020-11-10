package sunil.noticeBoard.model;

public class Member {
    private String email;
    private String name;
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

    public void setEmail(String email) {
        this.email = email;
    };
    public void setName(String name) {
        this.name = name;
    };
    public void setPhone(String phone) {
        this.phone = phone;
    };
    public void setRank(String rank) {
        this.rank = rank;
    };

    public String toString() {
        String memberDataText = "email : " + this.email + "\r name : " + this.name + "\r phone : " + this.phone + "\r rank : " + this.rank;

        return memberDataText;
    };
    public String[] toArray() {
        String[] memberDataArray = {this.email, this.name, this.phone, this.rank};

        return memberDataArray;
    };
};
