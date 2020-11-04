window.onload = function() {
    const $email = document.querySelector("#Email");
    const $name = document.querySelector("#Name");
    const $password = document.querySelector("#Password");
    const $passwordCheck = document.querySelector("#PasswordCheck");
    const $phone = document.querySelector("#phone");
    const $check = document.querySelector("#check");

    $email.addEventListener("keydown", function(event) {
        const { target, key } = event;

        if(key === "Enter" || key === "Tab") {
            event.preventDefault();

            if(!emailTypeCheck(target.value)) {
                $check.innerHTML = "이메일 형식이 잘못되었습니다";

                return $email.focus();
            };

            emailDuplicateCheck(target.value, data => {
                if(data) $email.focus();

                return $check.innerHTML = data;
            });

            $check.innerHTML = "";

            return $name.focus();
        };
    });
    $name.addEventListener("focusout", function({ target }) {
        if(target.value === "") return alert("이름칸이 비었습니다");
    });
    $passwordCheck.addEventListener("focusout", function({ target }) {
        const password = $password.value;
        const passwordCheck = target.value;

        return (password === passwordCheck) ? true : function () {
            $check.innerHTML = ("비밀번호가 일치하지 않습니다");

            $passwordCheck.focus();
        };
    });
    $phone.addEventListener("focusout", function({ target }) {
        if(!phoneFormCheck(target.value)) {
            $check.innerHTML = "전화번호 형식이 잘못되었습니다"

            return $phone.focus();
        };

        return $check.innerHTML = "";
    });

    document.forms[0].addEventListener("submit", function(event) {
        event.preventDefault();

        if($check.innerHTML === "") this.submit();
    });

    function phoneFormCheck(text) {
        if(text.length === 11)
            return text.match(new RegExp(/[0][1][0][0-9]{4}[0-9]{4}/g));

        if(text.length === 13)
            return text.match(new RegExp(/[0][1][0]*-[0-9]{4}-[0-9]{4}/g));
    };
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
};
