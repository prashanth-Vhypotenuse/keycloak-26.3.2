<#macro emailLayout>
    <html lang="${locale.language}" dir="${(ltr)?then('ltr','rtl')}">
    <style type='text/css'>
    body {
        margin: 0;
    }

    #email-container {
        width: 100%;
        margin: 0 auto;
        overflow-x: hidden;
    }

    p {
        font-family: Arial, Helvetica, sans-serif;
        font-weight: 400;
        font-size: 15px;
    }

    a {
        font-family: Arial, Helvetica, sans-serif;
        font-weight: 600;
        font-size: 14px;
        color: #ffffff;
        padding: 6px 10px;
        margin: 5px 0px;
        background-color: #003465;
        border-radius: 3px;
        text-decoration: none;
    }
    </style>

    <body>
        <div id='email-container'>
            <!-- Header -->
            <table role='presentation' border='0' cellspacing='0' width='100%'>
                <tr style='background-color: #3663b4; width: 100%; height: 50px; padding: 5px 5px;'>
                    <td style='font-family: Arial, Helvetica, sans-serif; font-size: 16px; text-align: center; padding: 0 0 0 10px; color: #ffffff;'> VHSuite </td>
                </tr>
            </table>
            <div style='font-family: Arial, Helvetica, sans-serif; font-size: 16px; padding: 5px 10px;'>
                <#nested>
            </div>
    </body>

    </html>
</#macro>