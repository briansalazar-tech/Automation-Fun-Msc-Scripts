# Get User Properties
The GetUserProperties.ps1 script gets desired information from "Get-ADUser -Properties *".

I created the script to retrieve only the information I found useful from the cmdlet.

An example being that sometimes employees would change their names and their information would have to be updated manually in programs. However, those updates sometimes had to wait until certain properties were updated in Active Directory.

The script first starts by asking for appropriate credentials. Although this part is optional, it is nice if using multiple accounts that separate permissions. 

Afterwords, the script asks for a user’s username. The script then enters a try catch block to see if the user exists. If the user exists, the desired properties are returned to the terminal. This process is executed until the script is exited.
