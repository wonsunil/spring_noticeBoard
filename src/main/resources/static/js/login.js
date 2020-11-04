window.onload = function() {
    const $email = document.querySelector("#email");
    const $password = document.querySelector("#password");
    const $check = document.querySelector("#check");

    $email.addEventListener("keydown", function(event) {
        const { target, key } = event;

        if(key === "Enter" || key === "Tab") {
            event.preventDefault();
            let check = true;

            if(!emailTypeCheck(target.value)) {
                $check.innerHTML = "이메일 형식이 잘못되었습니다";

                check = false;
                return $email.focus();
            };

            $check.innerHTML = "";

            if(check) $password.focus();
        };
    });

    document.forms[0].addEventListener("submit", function(event) {
        event.preventDefault();

        if($check.innerHTML === "") this.submit();
    });
};