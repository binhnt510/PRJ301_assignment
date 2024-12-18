<%-- 
    Document   : login
    Created on : Oct 23, 2024, 11:44:10 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
            
<link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-7/assets/css/login-7.css">
  <title>Document</title>
</head>
<body >
  <!-- Login 7 - Bootstrap Brain Component -->
<section class="bg-light p-3 p-md-4 p-xl-5" style="height: 100vh; background-image: url(img/5559852.jpg);">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
        <div class="card border border-light-subtle rounded-4">
          <div class="card-body p-3 p-md-4 p-xl-5">
            <div class="row">
              <div class="col-12">
                <div class="mb-5">
                  <div class="text-center mb-4">
                    <a href="#!">
                        <img src="http://localhost:9999/ta.com/img/logo123.jpg" alt="BootstrapBrain Logo" width="175" height="90">
                    </a>
                  </div>
                  <h4 class="text-center">Sign in to your account</h4>
                </div>
              </div>
            </div>
              <form action="login" method="post" id="loginForm">
              <div class="row gy-3 overflow-hidden">
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="username" id="username" required>
                    <label for="username" class="form-label">Username</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="password" id="password" value=""  required>
                    <label for="password" class="form-label">Password</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-check">
                    
                  </div>
                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button class="btn bsb-btn-xl btn-primary" type="submit">Log in now</button>
                  </div>
                </div>
              </div>
            </form>
            <div class="row">
              <div class="col-12">
                <hr class="mt-5 mb-4 border-secondary-subtle">
                
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  <script>
    document.getElementById('loginForm').addEventListener('submit', function(event) {
      event.preventDefault(); // Ngăn chặn form submit truyền thống

      var username = document.getElementById('username').value;
      var password = document.getElementById('password').value;

      var xhr = new XMLHttpRequest();
      xhr.open("POST", "login", true);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function() {
          console.log(xhr.responseText)
        if (xhr.readyState === 4 && xhr.status === 200) {
          if (xhr.responseText == 'success') {
            
            window.location.href = 'http://localhost:9999/ta.com/home'; // Chuyển hướng nếu đăng nhập thành công
          } else {
            alert('Tài khoản hoặc mật khẩu không đúng!');
          }
        }
      };

      xhr.send("username=" + encodeURIComponent(username) + "&password=" + encodeURIComponent(password));
    });
  </script>

</body>
</html>