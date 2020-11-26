window.onload = _ => {
    const $searchInput = document.querySelector("input");
    $searchInput.addEventListener("keyup", ({ target, key }) => {
        const value = target.value;

        if(key !== "Enter") return false;
        if(value === "") return false;

        location.href = "/content/search/" + value;
    });
};