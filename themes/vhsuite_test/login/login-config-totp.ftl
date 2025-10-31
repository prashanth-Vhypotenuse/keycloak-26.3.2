<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Verify OTP</title>
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
                    <h2 class="font-variety-black dashboard-heading white-text">Verify OTP</h2>
                    <form id="kc-totp-settings-form" onsubmit="return handleSubmit(event)" method="post" action="${url.loginAction}" class="login-sub-form-container">
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="totp" class="input-label">OTP</label>
                            <input id="totp" name="totp" type="text" placeholder="Enter otp" autofocus autocomplete="off" class="form-input input-value" />
                            <span id="totpError" class="error-text" />
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="submit-action-btn">Submit</button>
                        </div>
                    </form>
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
                <div class="footer policy-link">
                    Copyrights © ${.now?string("yyyy")}. VH Suite | <a href="#" style="color: white;">Privacy Policy</a>
                </div>
            </div>
        </div>
    </div>
    <script>
    let isSubmitPressed = false
    document.addEventListener("DOMContentLoaded", function() {
        const usernameInput = document.getElementById("totp");
        //Validate when user types or leaves the field
        usernameInput.addEventListener("input", validateOtp);
        usernameInput.addEventListener("blur", validateOtp);
    });

    function validateOtp() {
        if (isSubmitPressed) {
            const totp = document.getElementById("totp").value.trim();
            const error = document.getElementById("totpError");
            if (!username) {
                error.textContent = "Please enter a valid otp";
                error.style.display = "inline";
            } else {
                error.style.display = "none";
            }
        }
    }

    function validateAll() {
        validateOtp();
        const totp = document.getElementById("totp").value.trim();
        return totp;
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