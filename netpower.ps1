Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
Clear-Host
$host.ui.RawUI.WindowTitle = "PowerNet by:RichieSantos"
#Network tool made in powershell scripting 
function net #Function net it is the main script
{
Clear-Host
write-host " NETWORK ASSISTANT TOOL FOR NETWORK ADMINISTRATION" -foreground "yellow"
write-host ""
write-host ""
write-host "   -Available Options: " -foreground "yellow"
write-host ""
write-host "1.  Show Computer's Hostname."
write-host "2.  Show  IP configurations."
write-host "3.  Ping Destination "
write-host "4.  Display running processes."
write-host "5.  Nslookup."
write-host "6.  Show ARP table."
write-host "7.  Delete ARP table."
write-host "8.  Show Routing table."
write-host "9.  Delete Routing table."
write-host "10. Release your IP."
write-host "11. IP Renewal."
write-host "12. Flush DNS cache."
write-host "13. Show Network Adapter Options."
write-host "14. Shows current TCP/IP network connections "
write-host "15. Trace and address."
write-host "16. Show Mac address."
write-host "17. Turn off the firewall (Not recommended)."
write-host "18. Turn on the firewall."
write-host "19. Display DNS cache."
write-host "20. Network Adapter  " 
write-host "21. Fast Shutdown"
write-host "22. Restart Computer." 
write-host "23. Add local computer to a Domain. " 
write-host "24. Add a local computer to a Workgroup." 
write-host "25. Open System Information. "
write-host "26. Open Device Manager. "
write-host ""



$numlist = Read-Host -Prompt 'Choose a Number from the list ' 

 
if($numlist -eq 1)
{
Clear-Host
write-host "The Host Name is "
write-host ""
$env:COMPUTERNAME
write-host ""
 $save = Read-Host -Prompt 'Do you want to Save to a file in Desktop, y or n  '
if ($save -eq "y")
{
$env:COMPUTERNAME > %UserProfile%\Desktop\

}
pause
net
}


elseif($numlist -eq "2")

{
cls
write-host "Ip Configurations: "
Get-NetIPConfiguration

pause
net
}




elseif($numlist -eq "3")

{
cls
$ip = Read-Host -Prompt 'Please enter the IP address '
Test-Connection $ip 
write-host ""
$choose = Read-Host -Prompt 'Do you want to ping another address y or n'
write-host ""

       if ($choose -eq "y")

        {
        cls
        $ip2 = Read-Host -Prompt 'Please enter the IP address '
        Test-Connection $ip2
        write-host ""
        pause
        netools
        }



        else
        {
        net
        }

}



elseif($numlist -eq "4")

{
cls
write-host "Process  "
Get-Process
pause
net
}

elseif($numlist -eq "5")
{

cls
$look = Read-Host -Prompt 'Please enter the Domain  '
Resolve-DnsName $look
write-host ""






$looking = Read-Host -Prompt 'Do you want to perform another lookup? y or n'
write-host ""

       if ($looking -eq "y")

        {
        cls
        $look1 = Read-Host -Prompt 'Please enter the domain '
        Resolve-DnsName $look1
        write-host ""
        pause
        net
        }



        else
        {
        net
        }
pause
net
}


elseif($numlist -eq "6")
{
cls
write-host "ARP table "
Get-NetNeighbor
pause
net
}


elseif($numlist -eq "7")
{
cls
write-host "Delete ARP table "

pause
net
}



elseif($numlist -eq "8")
{
cls
write-host "Routing Table"
Get-NetRoute
write-host""
pause
net
}
elseif($numlist -eq "9")
{
cls
write-host "Deleting Routing table "
Remove-NetRoute
pause
net
}
elseif($numlist -eq "10")
{
cls
write-host "Release Ip "
 $lan.ReleaseDHCPLease()
pause
net 
}
elseif($numlist -eq "11")
{
cls
write-host "Renew Ip "
$lan.RenewDHCPLease()
pause
net
}
elseif($numlist -eq "12")
{
cls
write-host "Flush Dns "
Clear-DnsClientCache
pause
net 
}
elseif($numlist -eq "13")
{
cls
write-host "Opening network adapters options" 
ncpa.cpl
pause
net
}
elseif($numlist -eq "14")
{
cls
Get-NetTCPConnection | ? State -eq Established | FT -Autosize
pause
net
}
elseif($numlist -eq "15")
{
cls

$trace = Read-Host -Prompt 'Please enter the domain or ip address to trace '

Test-NetConnection $trace -TraceRoute

pause
net
}
elseif($numlist -eq "16")
{
cls
write-host " Computer Mac-address "
getmac
pause
net
}
elseif($numlist -eq "17")
{
cls
write-host "Firewall is no Off"

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled false
write-host "" 
pause
net
}
elseif($numlist -eq "18")
{
write-host "Firewall is On again "
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
write-host ""
pause
net
}
elseif($numlist -eq "19")
{
cls
write-host "Display DNS cache "
Get-DnsClientCache
pause
net
}


elseif($numlist -eq "20")
{
clear-host 
write-host "Network adapters "
write-host ""
get-netadapter
pause
net
}


elseif($numlist -eq "21")
{
Stop-Computer
}


elseif($numlist -eq "22")
{
 Restart-Computer
}


elseif($numlist -eq "23")
{
clear-host
$cname = Read-Host -Prompt 'Do you want to change the computer name? , y or n '
if ( $cname -eq "y")
{
clear-host
$cname1 = Read-Host -Prompt 'Please enter the new computer Name  '
 $dom = Read-Host -Prompt 'Please enter the Domain Name  '
 
add-computer -DomainName $dom -ComputerName $cname1 -LocalCredential "installer" 
write-host ""
write-host Your computer have been added to the $dom domain with $cname1 as computer name. 
write-host ""
pause
net
}

else 
{
clear-host
 $dom = Read-Host -Prompt 'Please enter the Domain Name  '
add-computer -DomainName $dom -Credential "installer" 
write-host ""
write-host "Your computer have been added to the $dom domain. Please restar the computer"
write-host ""
pause
net
}

}
elseif($numlist -eq "24")
{
clear-host
 $work = Read-Host -Prompt 'Please enter the Workgroup Name  '
add-computer -WorkGroupName $work
write-host ""
write-host Your computer have been added to the  $work Workgroup. 
write-host ""
pause
net
}


elseif($numlist -eq "25")
{
cls
write-host "Computer Info: "
msinfo32
write-host""
pause
net
}


elseif($numlist -eq "26")
{
cls
write-host "Opening Device Manager: "
devmgmt.msc
write-host""
pause
net
}





else 
{
net
}






} #End of Function net. 




net #Calling the function. 