<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
    <header>
        <div class="container">
            <nav class="navbar navbar-expand-sm text-black">
                <a class="navbar-brand" href="index">Expand at sm</a>
                <div class="collapse navbar-collapse" id="navbarsExample03">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                        <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li>
                    </ul>
                    <div id="button-box" class="pull-right">
                        <button class="btn btn-default"><a href="/user/account/login">Sign in</a></button>
                        <button class="btn btn-default"><a href="/user/account/register">Sign up</a></button>
                    </div>
                </div>
            </nav>
            <section>
                <li>Sign up for <br> our service</li>
                <form id="sign-up">
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="text" id="email" class="pull-right" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" id="name" class="pull-right" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" class="pull-right" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="phone">번호</label>
                        <input type="text" id="phone" class="pull-right" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </section>
        </div>
    </header>
    <div id="content">

    </div>
</body>
</html>
