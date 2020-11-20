package sunil.noticeBoard.model;

public class User {
    private String email;
    private String name;
    private String phone;
    private String rank;
    private String profile_content;
    private String profile_image;

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
    public String getProfileContent() {
        return profile_content;
    };
    public String getProfileImage() {
        return profile_image;
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
    public void setProfileContent(String content) {
        this.profile_content = content;
    };
    public void setProfileImage(String imageUrl) {
        this.profile_image = imageUrl;
    };

    public String toString() {
        String userDataText = "email : " + this.email + "\r name : " + this.name + "\r phone : " + this.phone + "\r rank : " + this.rank;

        return userDataText;
    };
    public String[] toArray() {
        String[] userDataArray = {this.email, this.name, this.phone, this.rank, this.profile_content, this.profile_image};

        return userDataArray;
    };
};
