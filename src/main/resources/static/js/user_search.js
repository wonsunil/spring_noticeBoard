window.onload = _ => {
    const typeCheck = value => {
        const email_result = value.match(new RegExp(/[A-Z|a-z|0-9]*@[A-Za-z]*\.[A-Z|a-z]{2,3}/g));
        const email_result2 = value.match(new RegExp(/[A-Z|a-z|0-9]*@[A-Za-z]*\.[A-Z|a-z]{2,3}\.[A-Z|a-z]*/g));
        const name_result = value.match(new RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|A-Z|a-z]*$/g));

        if(email_result || email_result2) return "email";
        if(name_result) return "name";
    };

    const $searchInput = document.querySelector("input");
    $searchInput.addEventListener("keyup", ({ target, key }) => {
        const value = target.value;

        if(key !== "Enter") return false;
        if(value === "") return false;

        location.href = "/user/search/" + typeCheck(value) + "/" + value;
    });

    const $searchButton = document.querySelector("header button");
    $searchButton.addEventListener("click", _ => {
        const value = $searchInput.value;
        if(value === "") return false;

        location.href = "/user/search/" + typeCheck(value) + "/" + value;
    });
};