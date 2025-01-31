Import-Module Pode -MaximumVersion 2.99.99 -Force
Import-Module ..\src\Pode.Web.psm1 -Force

Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8090 -Protocol Http
    New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging

    # set the use of templates, and set a login page
    Use-PodeWebTemplates -Title 'Classy Styles' -Theme Dark

    # import the custom css/js
    Import-PodeWebStylesheet -Url '/my-styles.css'
    Import-PodeWebJavaScript -Url '/my-scripts.js'

    # set the home page controls
    $container = New-PodeWebContainer -Content @(
        New-PodeWebTextbox -Name 'Message' -CssClass 'my-custom-textbox'
        New-PodeWebParagraph -CssStyle @{ Color = 'Yellow' } -Elements @(
            New-PodeWebText -Value 'And then here is some more text, that also includes a '
            New-PodeWebLink -Value 'link' -Source 'https://google.com'
            New-PodeWebText -Value ' that takes you to Google'
        )
    )

    Set-PodeWebHomePage -Layouts $container -Title 'Page with STYLE'
}