# List and Delete Group Members from AD Group
I had originally created this script to list the users that were a part of Active Directory groups that made up classes. At the end of semesters, these groups would be emptied, and I wanted to provide myself with an audit trail of the users that were removed from those groups. In case an entire class group was removed when it should not have been.

This script was then expanded to programmatically remove those users from the groups if desired. The whole section deleting users from groups can be commented or uncommented out depending on what functionality is desired.

Additionally, the script exists within a loop allowing for group names to be copied and pasted into the prompt allowing for quick queries of multiple groups.
