function emailTypeCheck(email) {
    const emailCheckResult = email.match(new RegExp(/[A-Z|a-z|0-9]*@[A-Za-z0-9]*\.[A-Z|a-z]{2,3}/g));

    return !!emailCheckResult;
};
function emailDuplicateCheck(email, callback) {
    const xhr = new XMLHttpRequest();
    const form = new FormData();

    form.append("email", email)
    xhr.open("POST", "/user/account/duplicate_check");

    xhr.send(form);
    xhr.onreadystatechange = async function () {
        if (xhr.readyState === 4) {
            await callback(xhr.response.trim());
        };
    };
};