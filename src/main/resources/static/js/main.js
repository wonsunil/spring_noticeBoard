window.onload = function() {
    const createAlert = text => {
        const box = document.createElement("div");
        const li = document.createElement("li");
        const button = document.createElement("button");

        box.setAttribute("id", "alert");

        box.style.width = "300px";

        li.innerHTML = text;
        button.innerHTML = "확인";

        button.addEventListener("click", ({ target }) => {
            target.parentNode.parentNode.removeChild(target.parentNode);

            location.href = "/user/account/login";
        });

        box.append(li, button);
        document.body.append(box);
    };

    document.body.addEventListener("click", event => {
        if(document.querySelector("#alert") !== null) event.preventDefault();
    });
    const xhr = new XMLHttpRequest();

    xhr.responseType = "json";

    const $write = document.querySelector("#write");
    $write.addEventListener("click", function(event) {
        if(email === "") {
            event.preventDefault();

            createAlert("로그인한 유저만 접근 가능합니다");
        };
    });

    const $selectBox = document.querySelector("select[name='limit']");
    $selectBox.onchange = ({ target }) => {
        const limit = [...target.children].filter(option => option.selected === true)[0].getAttribute("value");

        location.href = "/pagination/set/" + limit;
    };
};