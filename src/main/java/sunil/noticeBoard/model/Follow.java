package sunil.noticeBoard.model;

public class Follow {
    private String follower;
    private String following;

    public String getFollower() {
        return follower;
    };
    public String getFollowing() {
        return following;
    };

    public String[] toArray() {
        String[] followArray = {this.follower, this.following};

        return followArray;
    };
};
