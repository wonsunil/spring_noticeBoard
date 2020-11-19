window.onload = function() {
    document.body.addEventListener("click", ({ target }) => {
        if(target.getAttribute("id") === "setting") {
            const $userInfo = document.querySelector("#user-info");
            $userInfo.style.display = "none";

            $userInfo.insertAdjacentHTML("beforebegin", `
                <section class="user-setting">
                    <div>
                        <ul>
                            <img class="profile-img" src="${$userInfo.children[0].children[0].children[0].getAttribute("src")}" alt="">
                            <li id="email">${$userInfo.children[0].children[0].children[1].innerHTML}</li>
                        </ul>
                    </div>
                    <textarea>${$userInfo.children[1].children[0].innerHTML}</textarea>
                    <button id="save">저장</button>
                </section>
            `);
        };

        if(target.getAttribute("id") === "save") {
            const $userInfo = document.querySelector("#user-info");
            $userInfo.style.display = "flex";
            $userInfo.children[1].children[0].innerHTML = target.parentNode.children[1].value;

            target.parentNode.parentNode.removeChild(target.parentNode);

            let content = "";

            $userInfo.children[1].children[0].innerHTML.split("\n").map(function(value) {
                content += `<li>${value}</li><br/>`;
            });

            const form = new FormData();
            form.append("email", $userInfo.children[0].children[0].children[1].innerHTML);
            form.append("content", content);

            const xhr = new XMLHttpRequest();

            xhr.open("POST", "/user/profile/update");
            xhr.send(form);
        };
    });
    document.body.addEventListener("mouseover", ({ target }) => {
        if(!target.classList.contains("profile-img")) return false;

        target.parentNode.classList.add("change-img");
    });
    document.body.addEventListener("mouseout", ({ target }) => {
        if(!target.classList.contains("change-img")) return false;

        target.classList.remove("change-img");
    });
};