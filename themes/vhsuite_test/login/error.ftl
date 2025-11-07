<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>VHSuite - Error Page</title>
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
                        <#elseif client?? && client.clientId=="vhsuite-rtsm-portal">
                            RTSM
                            <#elseif client?? && client.clientId=="vhsuite-support-portal">
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
                <h1 class="font-variety-black dashboard-heading white-text">
                    ${message.summary}
                </h1>
                <#if skipLink??>
                    <#else>
                        <#if pageRedirectUri?has_content>
                            <p><a href="${pageRedirectUri}" style="color: white">
                                    ${kcSanitize(msg("backToApplication"))?no_esc}
                                </a></p>
                            <#elseif actionUri?has_content>
                                <p><a href="${actionUri}" style="color: white">
                                        ${kcSanitize(msg("proceedWithAction"))?no_esc}
                                    </a></p>
                                <#elseif (client.baseUrl)?has_content>
                                    <p><a href="${client.baseUrl}" style="color: white">
                                            ${kcSanitize(msg("backToApplication"))?no_esc}
                                        </a></p>
                        </#if>
                </#if>
            </div>
        </div>
    </div>
</body>

</html>