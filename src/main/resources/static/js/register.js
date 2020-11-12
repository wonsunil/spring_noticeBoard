window.onload = function() {
    const phoneFormCheck = function(text) {
        if(text.length === 11)
            return text.match(new RegExp(/[0][1][0][0-9]{4}[0-9]{4}/g));

        if(text.length === 13)
            return text.match(new RegExp(/[0][1][0]*-[0-9]{4}-[0-9]{4}/g));
    };
    const emailTypeCheck = function(email) {
        const emailCheckResult = email.match(new RegExp(/[A-Z|a-z0-9]*@[A-Za-z0-9]*\.[A-Z|a-z]{1,3}/g));

        return !!emailCheckResult;
    };
    const emailDuplicateCheck = function(email, callback) {
        const xhr = new XMLHttpRequest();
        const form = new FormData();

        form.append("email", email)
        xhr.open("POST", "/user/account/duplicate_check");

        xhr.send(form);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                callback(xhr.response.trim());
            };
        };
    };

    const $email = document.querySelector("#email");
    const $name = document.querySelector("#name");
    const $password = document.querySelector("#password");
    const $passwordCheck = document.querySelector("#passwordCheck");
    const $phone = document.querySelector("#phone");

    document.forms[0].addEventListener("submit", function(event) {
        event.preventDefault();

        if(!emailTypeCheck($email.value)) {
            alert("이메일 형식이 잘못되었습니다");

            return $email.focus();
        };

        if($name.value === "") {

            alert("이름칸이 비었습니다");
            return $name.focus();

        };
        if($password.value !== $passwordCheck.value) {
            alert("비밀번호가 일치하지 않습니다");

            return $passwordCheck.focus();
        };
        if(!phoneFormCheck($phone.value)) {
            alert("전화번호 형식이 잘못되었습니다");

            return $phone.focus();
        };

        emailDuplicateCheck($email.value, function(data) {
            if(data === "false") {
                alert("중복된 이메일입니다.");

                return $email.focus();
            };

            return document.forms[0].submit();
        });
    });
};
