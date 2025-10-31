<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VHSuite - Update Profile</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/style.css" />
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .update-container {
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #2ecc71;
        border: none;
        color: #fff;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #27ae60;
    }
    </style>
</head>

<body>
    <div class="update-container">
        <h2>Update Your Profile</h2>
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if messagesPerField.exists('firstName')>
                <div class="error">
                    ${messagesPerField.get('firstName')}
                </div>
            </#if>
            <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" placeholder="First Name" required />
            <#if messagesPerField.exists('lastName')>
                <div class="error">
                    ${messagesPerField.get('lastName')}
                </div>
            </#if>
            <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" placeholder="Last Name" required />
            <#if messagesPerField.exists('email')>
                <div class="error">
                    ${messagesPerField.get('email')}
                </div>
            </#if>
            <input type="email" id="email" name="email" value="${(user.email!'')}" placeholder="Email" required />
            <#if realm.editUsernameAllowed>
                <input type="text" id="username" name="username" value="${(user.username!'')}" placeholder="Username" required />
            </#if>
            <button type="submit">Save Changes</button>
        </form>
    </div>
</body>

</html>