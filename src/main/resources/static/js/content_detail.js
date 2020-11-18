window.onload = function() {
    const $textarea = document.querySelector("#content");
    const $rewriteButton = document.querySelector("#rewrite");

    $rewriteButton?.addEventListener("click", function(event) {
        if(document.querySelector("#save") !== null) return false;

        let replaceContent = content.replaceAll("<li>", "");
        replaceContent = replaceContent.replaceAll("</li>", "");
        replaceContent = replaceContent.replaceAll("<br/>", "\n\n");

        $content.style.display = "none";
        $wrap.insertAdjacentHTML("beforeend", "<textarea>" + replaceContent + "</textarea>");
        $rewriteButton.insertAdjacentHTML("afterend", "<button id='save'>저장</button>");
    });

    document.body.addEventListener("click", function({ target }) {
        if(target.getAttribute("id") === "save") {
            const $textarea = document.querySelector("textarea");

            let text = "";

            $textarea.value.split("\n").filter( v => v != "").map(v => {
                text += "<li>" + v + "<li><br/>";
            });

            $content.innerHTML = text;
            $content.style.display = "block";

            $textarea.parentNode.removeChild($textarea);
            executeXhr("/content/rewrite", {method: "POST", data: {content: text}});

            target.parentNode.removeChild(target);
        };
        if(target.getAttribute("id") === "delete") {
            executeXhr("/content/delete", {method: "DELETE",  data: {content: $textarea.value}});

            location.href = "/main";
        };
    });
};