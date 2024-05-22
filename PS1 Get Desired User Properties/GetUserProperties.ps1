# Script was created as sometimes users would have their names changed and names would have to be manually updated in programs. 
# However, sometimes those manual updates would have to wait until properties in AD have been synced and updated otherwise duplicate accounts may be created.
# Script is also useful in seeing if a user has activated their account and account populated in AD.

$creds = Get-Credential -Message "Enter credentials, some properties are only visible with appropriate credentials."
Write-Host "Credentials accepted"

# Retreive the user's username (SAM). Username will be ran through get-aduser cmdlet and desired properties will be displayed in output.
$username = read-host "Please enter a valid username to search"
while($username -ne "exit")
{
    try {
        $userproperties = get-aduser -Credential $creds -Identity $username -Properties *

        # Properties returned from running get-aduser -Properties *. Simply add or remove filtered properties to only display information you find useful. 
        # write-host "TEXT" $userproperties.PROPERTY

        write-host "`nFull name: " $userproperties.Name
        write-host "Account is enabled (True/False): " $userproperties.Enabled
        write-host "Email address: " $userproperties.mail
        write-host "UPN: " $userproperties.UserPrincipalName
    }
    catch {
        Write-Host "`nInvalid username. Please try again."
    }

$username = read-host "`nEnter a valid username or 'exit' to quit"
}
