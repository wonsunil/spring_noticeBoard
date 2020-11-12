window.onload = function() {
    const $email = document.querySelector("#email");
    const emailTypeCheck = function(email) {
        const emailCheckResult = email.match(new RegExp(/[A-Z|a-z|0-9]*@[A-Za-z0-9]*\.[A-Z|a-z]{2,3}/g));

        return !!emailCheckResult;
    };

    document.forms[0].addEventListener("submit", function(event) {
        event.preventDefault();

        if(!emailTypeCheck($email.value)) {
            alert("이메일 형식이 잘못되었습니다");

            return $email.focus();
        };

        return this.submit();
    });
};