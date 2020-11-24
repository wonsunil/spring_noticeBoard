package sunil.noticeBoard.model;

public class Follow {
    private String follower;
    private String following;
    private String profile_image;

    public String getFollower() {
        return follower;
    };
    public String getFollowing() {
        return following;
    };
    public String getProfileImage() {
        return profile_image;
    };

    public void setFollower(String follower) {
        this.follower = follower;
    };
    public void setFollowing(String following) {
        this.following = following;
    };
    public void setProfileImage(String profileImage) {
        this.profile_image = profileImage;
    };

    public String[] toArray() {
        String[] followArray = {this.follower, this.following, this.profile_image};

        return followArray;
    };
};
