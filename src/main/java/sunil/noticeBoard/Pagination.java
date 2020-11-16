package sunil.noticeBoard;

import org.springframework.beans.factory.annotation.Autowired;
import sunil.noticeBoard.model.Content;
import sunil.noticeBoard.service.ContentService;

import java.util.List;

public class Pagination {
    @Autowired
    ContentService contentService;

    private int limit = 10;
    private int currentPage;
    private int range = 0;
    private int startIndex = 0;
    private int lastIndex = 0;

    public int getLimit() {
        return this.limit;
    };
    public int getCurrentPage() {

        return this.currentPage;
    };
    public int getRange() {
        try{
            System.out.println(contentService);
            List<Content> contentList = contentService.getAllContent();
            System.out.println(contentList);
        } catch (NullPointerException ignored) {
            System.out.println("contentList is null");
        };

        return this.range;
    };

    public void setCurrentPage(int page) {
        this.currentPage = page;
    };
};
