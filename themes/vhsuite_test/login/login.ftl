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
            <#-- <form id="kc-form-login" onsubmit="return handleSubmit(event)" class="login-sub-form-container"> -->
              <div>
                <label for="username" class="input-label">User name or Email</label>
                <input type="text" value="prashanth@vhypotenuse.com" id="username" name="username" placeholder="Enter username or email" autofocus autocomplete="off" class="form-input input-value" />
                <span id="usernameError" class="error-text"></span>
              </div>
              <div>
                <label for="password" class="input-label">Password</label>
                <div style="position: relative">
                  <input type="password" value="Test@123" id="password" name="password" placeholder="Enter password" class="form-input input-value" />
                  <span
                    id="togglePassword"
                    style="position: absolute; right: 12px; top: 10px; cursor: pointer; color: #666;
                  ">
                    <svg
                      id="eyeIcon"
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 640 512"
                      width="20"
                      height="20">
                      <path
                        d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                    </svg>
                  </span>
                </div>
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
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");
    //Validate when user types or leaves the field
    usernameInput.addEventListener("input", validateUsername);
    passwordInput.addEventListener("input", validatePassword);
    usernameInput.addEventListener("blur", validateUsername);
    passwordInput.addEventListener("blur", validatePassword);
    const togglePassword = document.getElementById("togglePassword");
    const eyeIcon = document.getElementById("eyeIcon");
    togglePassword.addEventListener("click", function() {
      const isPasswordVisible = passwordInput.type === "text";
      passwordInput.type = isPasswordVisible ? "password" : "text";
      // Toggle icon SVG (eye / eye-slash)
      eyeIcon.innerHTML = isPasswordVisible ?
        `<path d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />` :
        `<path d="M38.8 5.1C28.4-3.1 13.3-1.2 5.1 9.2S-1.2 34.7 9.2 42.9l592 464c10.4 8.2 25.5 6.3 33.7-4.1s6.3-25.5-4.1-33.7L525.6 386.7c39.6-40.6 66.4-86.1 79.9-118.4c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-68.2 0-125 26.3-169.3 60.8L38.8 5.1zM223.1 149.5C248.6 126.2 282.7 112 320 112c79.5 0 144 64.5 144 144c0 24.9-6.3 48.3-17.4 68.7L408 294.5c8.4-19.3 10.6-41.4 4.8-63.3c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3c0 10.2-2.4 19.8-6.6 28.3l-90.3-70.8zM373 389.9c-16.4 6.5-34.3 10.1-53 10.1c-79.5 0-144-64.5-144-144c0-6.9 .5-13.6 1.4-20.2L83.1 161.5C60.3 191.2 44 220.8 34.5 243.7c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c47.8 0 89.9-12.9 126.2-32.5L373 389.9z" />`;
    });
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
  /* function handleSubmit(event) {
    isSubmitPressed = true;
    event.preventDefault();
    if (validateLogin()) {
      document.getElementById("loader").style.display = "flex";
      event.target.submit();
    }
  } */
  function getRedirectUri() {
    const params = new URLSearchParams(window.location.search);
    const redirectUri = params.get('redirect_uri');
    if (redirectUri) return decodeURIComponent(redirectUri);
    // If redirect_uri is missing, try client_data
    const clientData = params.get('client_data');
    if (clientData) {
      try {
        const decoded = JSON.parse(atob(clientData));
        if (decoded.ru) return decoded.ru;
      } catch (e) {
        console.warn("Invalid client_data", e);
      }
    }
    return null;
  }

  function getClientId() {
    const params = new URLSearchParams(window.location.search);
    const clientId = params.get('client_id');
    return clientId ? decodeURIComponent(clientId) : null;
  }
  async function handleSubmit(event) {
    event.preventDefault();
    isSubmitPressed = true;
    if (!validateLogin()) return;
    const loader = document.getElementById("loader");
    loader.style.display = "flex";
    const form = event.target;
    const formData = new FormData(form);
    const redirectUri = getRedirectUri();
    try {
      const response = await fetch(form.action, {
        method: "POST",
        body: formData,
        redirect: "manual"
      });
      // Login Success — Keycloak sends redirect (302 or opaqueredirect)
      if (response.type === "opaqueredirect" || response.status === 302) {
        const redirectUri = getRedirectUri();
        const clientId = getClientId();
        console.log("redirectUri", redirectUri)
        if (clientId && ['security-admin-console', 'account-console'].includes(clientId)) {
          window.location.href = window.location.origin + '/realms/${realm.name}/account/applications';
        } else if (redirectUri) {
          window.location.href = redirectUri;
        } else {
          window.location.href = window.location.origin + '/realms/${realm.name}/account/applications';
        }
        loader.style.display = "none";
        return;
      } else {
        document.getElementById("passwordError").textContent =
          "Invalid username or password";
        document.getElementById("passwordError").style.display = "inline";
      }
      loader.style.display = "none";
    } catch (err) {
      loader.style.display = "none";
      document.getElementById("passwordError").textContent =
        "Network error. Please try again.";
      document.getElementById("passwordError").style.display = "inline";
    }
  }
  </script>
</body>

</html>