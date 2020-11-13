window.onload = function() {
    HTMLElement.prototype.contentRender = function(arr) {
        arr.map(item => {
            this.insertAdjacentHTML("beforeend", `
                <div class="contents" data-code=${item.contentCode}>
                <li class="board">${item.boardName}</li>
                <li class="writer">${item.writer}</li>
                <li class="title">${item.contentName}</li>
                <li class="content">${item.content}</li>
                </div>
            `
            );
        });
    };

    const rankPopup = function() {
        const $rank_info_popup = document.querySelector("#rank-info-popup");

        $rank_info_popup.style.display = "none";
    };

    const $rank = document.querySelector("#rank");

    $rank.addEventListener("click", function(event) {
        rankPopup();
    });

    const $email = document.querySelector("#email");
    const email = $email.innerHTML.trim().split(":")[1].trim();

    const $contents = document.querySelector("#contents");

    const xhr = new XMLHttpRequest();

    xhr.responseType = "json";
    xhr.open("GET", `/content/user-content?email=${email}`);

    xhr.send();

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4) {
            $contents.contentRender(xhr.response);
        };
    };
};