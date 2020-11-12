window.onload = function() {
    HTMLElement.prototype.render = function(arr) {
        arr.map(item => {
            this.insertAdjacentHTML("beforeend", `
                <div class="contents">
                <li class="board">${item.boardName}</li>
                <li class="writer">${item.writer}</li>
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

    const xhr = new XMLHttpRequest();
    const $email = document.querySelector("#email");

    xhr.responseType = "json";
    xhr.open("GET", `/content/user-content?email=${$email.innerHTML}`);
    xhr.send();

    const $userContent = document.querySelector("#user-content");

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4) {
            $userContent.render(xhr.response);
        };
    };
};