<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>VHSuite - Update Password</title>
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
            <h2 class="font-variety-black dashboard-heading white-text">Update password</h2>
            <span class="white-text login-sub-message">You need to change your password.</span>
          </div>
          <form id="kc-form-login" onsubmit="return handleSubmit(event)" method="post" action="${url.loginAction}" class="login-sub-form-container">
            <div>
              <label for="password-new" class="input-label">New Password</label>
              <input type="password" id="password-new" name="password-new" placeholder="Enter new password" autofocus autocomplete="off" class="form-input input-value">
              <span id="newPasswordError" class="error-text" />
            </div>
            <div>
              <label for="password-confirm" class="input-label">Confirm Password</label>
              <input type="password" id="password-confirm" name="password-confirm" placeholder="Enter confirm password" class="form-input input-value">
              <span id="confirmPasswordError" class="error-text">Please enter confirm password</span>
            </div>
            <div class="form-actions">
              <button type="submit" class="submit-action-btn">Submit</button>
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
  function validateAll() {
    let valid = true;
    const newPassword = document.getElementById("password-new").value;
    const confirmPassword = document.getElementById("password-confirm").value;
    if (!newPassword) {
      document.getElementById("newPasswordError").style.display = "inline";
      valid = false;
    } else {
      document.getElementById("newPasswordError").style.display = "none";
    }
    if (!confirmPassword) {
      document.getElementById("confirmPasswordError").style.display = "inline";
      valid = false;
    } else {
      document.getElementById("confirmPasswordError").style.display = "none";
    }
    return valid;
  }
  let isSubmitPressed = false
  document.addEventListener("DOMContentLoaded", function() {
    const newPasswordInput = document.getElementById("password-new");
    const confirmPasswordInput = document.getElementById("password-confirm");
    //Validate when user types or leaves the field
    newPasswordInput.addEventListener("input", validateNewPassword);
    confirmPasswordInput.addEventListener("input", validateConfirmPassword);
    newPasswordInput.addEventListener("blur", validateNewPassword);
    confirmPasswordInput.addEventListener("blur", validateConfirmPassword);
  });

  function validateNewPassword() {
    if (isSubmitPressed) {
      const newPasswordInput = document.getElementById("password-new").value.trim();
      const error = document.getElementById("newPasswordError");
      if (!newPasswordInput) {
        error.textContent = "Please enter a valid password";
        error.style.display = "inline";
      } else {
        error.style.display = "none";
      }
    }
  }

  function validateConfirmPassword() {
    if (isSubmitPressed) {
      const newPasswordInput = document.getElementById("password-new").value.trim();
      const confirmPasswordInput = document.getElementById("password-confirm").value.trim();
      const error = document.getElementById("confirmPasswordError");
      if (!confirmPasswordInput) {
        error.textContent = "Please enter a valid confirm password";
        error.style.display = "inline";
      } else if (newPasswordInput !== confirmPasswordInput) {
        error.textContent = "New Password and confirm password mismatch";
        error.style.display = "inline";
      } else {
        error.style.display = "none";
      }
    }
  }

  function validateAll() {
    validateNewPassword();
    validateConfirmPassword();
    const newPasswordInput = document.getElementById("password-new").value.trim();
    const confirmPasswordInput = document.getElementById("password-confirm").value.trim();
    return newPasswordInput && confirmPasswordInput;
  }

  function handleSubmit(event) {
    isSubmitPressed = true;
    event.preventDefault();
    if (validateAll()) {
      document.getElementById("loader").style.display = "flex";
      event.target.submit();
    }
  }
  </script>
</body>

</html>