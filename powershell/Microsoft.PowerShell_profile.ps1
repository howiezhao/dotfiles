Import-Module posh-git
Import-Module DockerCompletion
Import-Module Carbon
Import-Module windows-screenfetch

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\ys.omp.json" | Invoke-Expression

<#
.Synopsis
This function will set the proxy settings provided as input to the cmdlet.
.Description
This function will set the proxy server and (optinal) Automatic configuration script.
.Parameter ProxyServer
This parameter is set as the proxy for the system.
Data from. This parameter is Mandatory
.Example
Setting proxy information
Set-InternetProxy -proxy "proxy:7890"
.Example
Setting proxy information and (optinal) Automatic Configuration Script 
Set-InternetProxy -proxy "proxy:7890" -acs "http://proxy:7892"
#>


Function Set-InternetProxy
{
    [CmdletBinding()]
    Param(
        
        [Parameter(Mandatory=$True,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [String[]]$Proxy,

        [Parameter(Mandatory=$False,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [AllowEmptyString()]
        [String[]]$acs
                
    )

    Begin
    {

            $regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
        
    }
    
    Process
    {
        
        Set-ItemProperty -path $regKey ProxyEnable -value 1

        Set-ItemProperty -path $regKey ProxyServer -value $proxy
                            
        if($acs) 
        {            
            
                 Set-ItemProperty -path $regKey AutoConfigURL -Value $acs          
        }

    } 
    
    End
    {

        Write-Output "Proxy is now enabled"

        Write-Output "Proxy Server : $proxy"

        if ($acs)
        {
            
            Write-Output "Automatic Configuration Script : $acs"

        }
        else
        {
            
            Write-Output "Automatic Configuration Script : Not Defined"

        }
    }
}

function Get-PublicIP
{
    Invoke-RestMethod https://myip.ipip.net
}

function Get-AllHistory
{
    cat (Get-PSReadlineOption).HistorySavePath
}
