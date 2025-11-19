<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="${url.resourcesPath}/assets/images/favicon.ico" />
    <title>
        VHSuite - ${message.summary}
    </title>
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
                <div class="login-sub-form-container">
                    <div>
                        <div id="kc-info-message">
                            <h2 class="font-variety-black dashboard-heading white-text">
                                ${message.summary}
                            </h2>
                            <p class="instruction">
                                <#if requiredActions??>
                                    <#list requiredActions> <b>
                                            <#items as reqActionItem>
                                                ${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}
                                                <#sep>,
                                            </#items>
                                        </b></#list>
                                    <#else>
                                </#if>
                            </p>
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
            </div>
            <div class="footer policy-link">
                Copyrights © ${.now?string("yyyy")}. VH Suite | <a href="#" style="color: white;">Privacy Policy</a>
            </div>
        </div>
    </div>
    <div id="kc-info-message" class="custom-info-card">
        <h2 class="info-title">
            ${kcSanitize(msg("actionRequired")!message.summary)?no_esc}
        </h2>
        <p class="info-text">
            <#if requiredActions??>
                <#list requiredActions>
                    <b>
                        <#items as reqActionItem>
                            ${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}
                            <#sep>,
                        </#items>
                    </b>
                </#list>
                <#else>
                    ${kcSanitize(message.summary)?no_esc}
            </#if>
        </p>
        <div class="info-actions">
            <#if skipLink??>
                <#else>
                    <#if pageRedirectUri?has_content>
                        <meta http-equiv="refresh" content="0;url=${pageRedirectUri}">
                        <#elseif actionUri?has_content>
                            <meta http-equiv="refresh" content="0;url=${actionUri}">
                            <#elseif (client.baseUrl)?has_content>
                                <meta http-equiv="refresh" content="0;url=${client.baseUrl}">
                                <#elseif message.summary==accountUpdatedMessage || message.summary==accountPasswordUpdatedMessage>
                                    <meta http-equiv="refresh" content="0;url=${url.realmAccountUrl}">
                    </#if>
            </#if>
        </div>
    </div>
</body>

</html>