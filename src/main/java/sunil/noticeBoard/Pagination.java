package sunil.noticeBoard;

public class Pagination {
    private int limit = 10;
    private int currentPage = 1;
    private int lastPage = 0;
    private int range = 0;
    private int startIndex = 1;
    private int lastIndex = 0;

    public int getLimit() {
        return this.limit;
    };
    public int getCurrentPage() {
        return this.currentPage;
    };
    public int getRange() {
        return this.range;
    };
    public int getStartIndex() {
        return this.startIndex;
    };
    public int getLastIndex() {
        return this.lastIndex;
    };
    public int getLastPage() {
        return this.lastPage;
    };

    public void setCurrentPage(int page) {
        this.currentPage = page;
    };
    public void setRange(int range) {
        this.range = range;
    };
    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    };
    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    };
    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    };
    public void setLimit(int limit) {
        this.limit = limit;
    };
};
