<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>VHSuite - Login</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/main.css" />
</head>

<body>
  <div class="main-wrapper">
    <div class="left-pane">
      <h1 class="login-portal-description">
        Simplify your workflow with the world’s most intuitive and secure
        <span class="highlighted-text">
          <#if client?? && client.clientId=="vhsuite-etmf-portal">
            ETMF
            <#elseif client.clientId=="vhsuite-rtsm-portal">
              RTSM
              <#elseif client.clientId=="vhsuite-support-portal">
                Support
                <#else>
                  EDC
          </#if>
        </span> solution
      </h1>
      <img src="${url.resourcesPath}/assets/images/login-info.svg" alt="banner image" class="left-pane-image" />
    </div>
    <div class="right-pane">
      <div class="login-form-container">
        <div class="login-sub-form-container">
          <div>
            <h2 class="font-variety-black dashboard-heading white-text">Hello!</h2>
            <span class="white-text login-sub-message">
              Welcome to
              <#if client?? && client.clientId=="vhsuite-etmf-portal">
                ETMF
                <#elseif client.clientId=="vhsuite-rtsm-portal">
                  RTSM
                  <#elseif client.clientId=="vhsuite-support-portal">
                    Support
                    <#else>
                      EDC
              </#if>
              solution
            </span>
          </div>
          <form id="kc-form-login" onsubmit="return handleSubmit(event)" method="post" action="${url.loginAction}" class="login-sub-form-container">
            <div>
              <label for="username" class="input-label">User name or Email</label>
              <input type="text" id="username" name="username" placeholder="Enter username or email" autofocus autocomplete="off" class="form-input input-value" />
              <span id="usernameError" class="error-text"></span>
            </div>
            <div>
              <label for="password" class="input-label">Password</label>
              <input type="password" id="password" name="password" placeholder="Enter password" class="form-input input-value">
              <span id="passwordError" class="error-text"></span>
            </div>
            <div class="form-actions">
              <button type="submit" class="submit-action-btn">Login</button>
              <a href="${url.loginResetCredentialsUrl}" class="login-sub-message white-text">Forgot password?</a>
            </div>
          </form>
        </div>
      </div>
      <div class="footer policy-link">
        Copyrights © ${.now?string("yyyy")}. VH Suite | <a href="#" style="color: white;">Privacy Policy</a>
      </div>
    </div>
    <div id="loader" class="loader">
      <div class="spinner" style="
          border: 6px solid #f3f3f3;
          border-top: 6px solid #002244;
          border-radius: 50%;
          width: 50px;
          height: 50px;
          animation: spin 1s linear infinite;
      " />
    </div>
  </div>
  <script>
  let isSubmitPressed = false
  document.addEventListener("DOMContentLoaded", function() {
    console.log("isSubmitPressed", isSubmitPressed)
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");
    //Validate when user types or leaves the field
    usernameInput.addEventListener("input", validateUsername);
    passwordInput.addEventListener("input", validatePassword);
    usernameInput.addEventListener("blur", validateUsername);
    passwordInput.addEventListener("blur", validatePassword);
  });

  function validateUsername() {
    if (isSubmitPressed) {
      const username = document.getElementById("username").value.trim();
      const error = document.getElementById("usernameError");
      console.log("isSubmitPressed", isSubmitPressed)
      if (!username) {
        error.textContent = "Please enter a valid username or email";
        error.style.display = "inline";
      } else {
        error.style.display = "none";
      }
    }
  }

  function validatePassword() {
    if (isSubmitPressed) {
      const password = document.getElementById("password").value.trim();
      const error = document.getElementById("passwordError");
      if (!password) {
        error.textContent = "Please enter a valid password";
        error.style.display = "inline";
      } else {
        error.style.display = "none";
      }
    }
  }

  function validateLogin() {
    validateUsername();
    validatePassword();
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    return username && password;
  }

  function handleSubmit(event) {
    isSubmitPressed = true;
    event.preventDefault();
    if (validateLogin()) {
      document.getElementById("loader").style.display = "flex";
      event.target.submit();
    }
  }
  </script>
</body>

</html>