window.onload = function() {
    const xhr = new XMLHttpRequest();

    xhr.responseType = "json";

    document.body.addEventListener("keyup", function({ target, key }) {
        if(target.getAttribute("id") !== "search-content") return false;

        if(key === "Enter") {
            xhr.open("GET", "/content/search?contentName="+target.value+"");
            xhr.send();

            xhr.onreadystatechange = function() {
                if(xhr.readyState === 4) {
                    if(xhr.response.length === 0) return alert("검색결과가 없습니다");

                    return location.href = `/main?search=${target.value}`;
                };
            };
        };
    });
};