window.onload = function() {
    const getDate = function(date) {
        const year = date.getFullYear();

        let month = (1 + date.getMonth());
        month = month >= 10 ? month : '0' + month;

        let day = date.getDate();
        day = day >= 10 ? day : '0' + day;

        return  year + "/" + month + "/" + day;
    };

    const file_type_check = function(img) {
        img.match(new RegExp(/\.png|\.jpg|\.jpeg|\.git|\.bmp/));
    };

    const $form = document.forms[0];
    const $board = $form.children[0];
    const $writer = $form.children[1];
    const $contentName = $form.children[2];
    const $content = $form.children[4];

    $form.addEventListener("submit", function(event) {
        event.preventDefault();

        const form = new FormData();

        if($content.innerHTML === null) {
            $content.focus();

            return alert("공백은 넣을 수 없습니다.");
        };

        form.append("noticeBoard", $board.innerHTML);
        form.append("writer", $writer.innerHTML.replaceAll(" ", "").split(":")[1]);
        form.append("contentName", $contentName.value);
        form.append("content", $content.value);
        form.append("updatedDate", getDate(new Date()));

        const xhr = new XMLHttpRequest();

        xhr.open("POST", "/content/content-write");
        xhr.send(form);

        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4) {
                if(xhr.response) location.href = "/main";
            };
        };
    });

    const $img = document.querySelector("input[type='file']");
    $img.addEventListener("change", function({ target }) {
        if(file_type_check(target.value) === null) {
            target.value = "";
            return alert("이미지 파일만 선택가능합니다");
        };

        return;
    });

    const $selectBox = document.querySelector("select");
    $selectBox.addEventListener("change", function({ target }) {
        const value = [...target.children].filter( v => v.selected)[0].innerHTML;

        document.querySelector("#boardName").innerHTML  = value;
    });
};