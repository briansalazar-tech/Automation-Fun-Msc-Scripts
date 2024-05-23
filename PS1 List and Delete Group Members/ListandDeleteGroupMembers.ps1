$creds = Get-Credential -Message "Enter credentials"
$groupname = read-host "Please enter a valid group name"

while($groupname -ne "exit")
{
    # Read SamAccountName's of users in AD Group to terminal
    try {
        write-host $groupname
        $users = Get-ADGroupMember -Credential $creds -Identity "$groupname"| Where-Object { $_.objectClass -eq "user"} | Select-Object SamAccountName | Format-Table # Excludes nested groups
        $users
        $usercount = (Get-ADGroupMember -Identity "$groupname"| Where-Object { $_.objectClass -eq "user"} | Select-Object objectClass).objectClass.Count
        write-host "Total number of users in group: $usercount"

        # Delete users from AD Group
        # if ($usercount -gt 0)
        # {
        #     $asktodelete = Read-Host "Delete users from group? (y/n)"
            
        #     if ($asktodelete -eq "y")
        #     {
        #         Write-Host "Removing users from group"
        #         try {
        #             foreach ($user in $users)
        #             {
        #                 Remove-ADGroupMember -Identity $groupname -Members $user.SamAccountName -Confirm:$false
        #             }
        #             Write-Host "Users removed"
        #             }
                
        #         catch {
        #             Write-Host "Error: Unable to delete users. Credentials may not have appropriate permissions or admin PS not launched."
        #         }

        #     }
        }
    }

    catch {
        Write-Host "`nError: Invalid Group name. Please try again."
    }

    $groupname = read-host "`nEnter another valid group name or 'exit' to quit"
}
