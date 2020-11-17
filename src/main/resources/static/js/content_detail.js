window.onload = function() {
    const $textarea = document.querySelector("#content");
    const $change = document.querySelector("#change");

    $change.addEventListener("focusout", function() {
        this.innerHTML = this.value;
    })

    const $rewriteButton = document.querySelector("#rewrite");

    $rewriteButton?.addEventListener("click", function(event) {
        $textarea.disabled = false;
        $textarea.classList.add("editing");
        $change.classList.remove("editing");

        if(document.querySelector("#save") !== null) return false;

        $rewriteButton.insertAdjacentHTML("afterend", "<button id='save'>저장</button>");
    });
    
    document.body.addEventListener("click", function({ target }) {
        if(target.getAttribute("id") === "save") {
            $textarea.disabled = true;
            $textarea.innerHTML = $change.innerHTML;

            executeXhr("/content/rewrite", {method: "POST", data: {content: $textarea.value}});

            target.parentNode.removeChild(target);
            $textarea.classList.remove("editing");
            $change.classList.add("editing");
        };
        if(target.getAttribute("id") === "delete") {
            executeXhr("/content/delete", {method: "DELETE",  data: {content: $textarea.value}});

            location.href = "/main";
        };
    });
};