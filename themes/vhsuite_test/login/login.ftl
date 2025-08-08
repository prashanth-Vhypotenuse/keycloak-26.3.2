<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #fff;
    }

    .main-wrapper {
      display: flex;
      min-height: 100vh;
      flex-direction: row;
    }

    .left-pane {
      width: 60%;
      background-color: #fff;
      padding: 4rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .left-pane h1 {
      font-size: 1.8rem;
      font-weight: 400;
      color: #444;
    }

    .left-pane h1 span {
      font-weight: 700;
      font-style: italic;
      color: #2c3e50;
    }

    .right-pane {
      width: 40%;
      background-color: #558bf8ff;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      border-top-left-radius: 4rem;
      border-bottom-left-radius: 4rem;
      padding: 3rem 2rem;
    }

    .form-container {
      width: 100%;
      max-width: 350px;
    }

    .form-container h2 {
      margin: 0 0 0.2rem;
    }

    .form-container span {
      font-size: 0.9rem;
      display: block;
      margin-bottom: 2rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-size: 0.9rem;
    }

    .form-group input {
      width: 100%;
      padding: 0.6rem 0.8rem;
      border-radius: 6px;
      border: none;
      font-size: 0.95rem;
    }

    .form-actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .form-actions button {
      background: #002244;
      border: none;
      color: #fff;
      padding: 0.5rem 1.5rem;
      font-weight: bold;
      border-radius: 6px;
      cursor: pointer;
    }

    .form-actions a {
      color: #fff;
      font-size: 0.85rem;
      text-decoration: none;
    }

    .form-actions a:hover {
      text-decoration: underline;
    }

    .footer {
      margin-top: 2rem;
      font-size: 0.75rem;
      text-align: center;
    }

    /* Responsive for mobile */
    @media (max-width: 768px) {
      .main-wrapper {
        flex-direction: column;
      }

      .left-pane, .right-pane {
        width: 100%;
        border-radius: 0;
      }

      .right-pane {
        padding: 2rem 1.5rem;
      }

      .left-pane {
        padding: 2rem 1.5rem;
        text-align: center;
      }

      .left-pane h1 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>
  <div class="main-wrapper">
    <div class="left-pane">
      <h1>
        Simplify your workflow with the world’s most intuitive and secure <span>EDC</span> solution
      </h1>
    </div>

    <div class="right-pane">
      <div class="form-container">
        <h2>Hello!</h2>
        <span>Welcome to EDC solution</span>

        <form id="kc-form-login" onsubmit="return validateLogin()" method="post" action="${url.loginAction}">
          <div class="form-group">
            <label for="username">Username or Email</label>
            <input type="text" value="prashanth@vhypotenuse.com" id="username" name="username" placeholder="Enter username or email" autofocus autocomplete="off">
            <span id="usernameError" style="display:none; color: #ffcccc; font-size: 0.8rem;">Please enter username or email</span>
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" value="Test@123" id="password" name="password" placeholder="Enter password">
            <span id="passwordError" style="display:none; color: #ffcccc; font-size: 0.8rem;">Please enter password</span>
          </div>

          <div class="form-actions">
            <button type="submit">Login</button>
            <a href="${url.loginResetCredentialsUrl}">Forgot password?</a>
          </div>
        </form>

        <div class="footer">
          Copyrights © ${.now?string("yyyy")}. VH Suite | <a href="#" style="color: white;">Privacy Policy</a>
        </div>
      </div>
    </div>
  </div>

  <script>
    function validateLogin() {
      let valid = true;
      const username = document.getElementById("username").value;
      const password = document.getElementById("password").value;

      if (!username) {
        document.getElementById("usernameError").style.display = "inline";
        valid = false;
      } else {
        document.getElementById("usernameError").style.display = "none";
      }

      if (!password) {
        document.getElementById("passwordError").style.display = "inline";
        valid = false;
      } else {
        document.getElementById("passwordError").style.display = "none";
      }

      return valid;
    }
  </script>
</body>
</html>
