
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script src="/js/register.js"></script>
    </head>
    <body>
    <form action="#" method="POST">
        <input type="text" id="Email" placeholder="이메일을 입력해주세요.">
        <input type="text" id="Name" placeholder="이름을 입력해주세요.">
        <input type="password" id="Password" placeholder="비밀번호를 입력해주세요.">
        <input type="password" id="PasswordCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
        <input type="text" id="phone" placeholder="전화번호를 입력해주세요.">
        <input type="submit">
    </form>
    </body>
    <script>
        const $email = document.querySelector("#Email");
        const $name = document.querySelector("#Name");
        const $password = document.querySelector("#Password");
        const $passwordCheck = document.querySelector("#PasswordCheck");
        const $phone = document.querySelector("#phone");

        $email.addEventListener("focusout", function({ target }) {
            return emailTypeCheck(target.value);
        });
        $passwordCheck.addEventListener("focusout", function({ target }) {
            const password = $password.value;
            const passwordCheck = target.value;

            if(password === passwordCheck) return console.log(true);

            return console.log(false);
        });

        document.forms[0].addEventListener("submit", function(event) {
            event.preventDefault();
        });

        function emailTypeCheck(email) {
            const check = email.match(new RegExp(/[A-Z|a-z|0-9]*@[A-Za-z]*\.[A-Z|a-z]{2,3}/g));

            if(check) return true;

            return alert("이메일 형식이 잘못되었습니다");
        };
        function passwordDuplicateCheck(password, secondPassword) {
            const check = password === secondPassword;

            if(check) return true;

            return alert("비밀번호가 서로 일치하지 않습니다");
        };
        function emailDuplicateCheck(email) {
            const xhr = new XMLHttpRequest();
            const form = new FormData();
            form.append("email", email)

            xhr.open("POST", "/user/account/duplicate_check");
            xhr.send(form);

            xhr.onreadystatechange = function() {
                if(xhr.readyState === 4) {
                    console.log(xhr.response.trim());
                };
            };
        };

        emailDuplicateCheck("seoni")
    </script>
</html>