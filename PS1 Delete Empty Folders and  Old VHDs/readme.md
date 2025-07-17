# Delete Empty Folders and Old VHD Files
This script was created to delete FSLogix VHD profiles from multiple RDS Session host collections.

Due to the nature of an academic environment, many users would utilize this environment. However, once students graduated or stopped using the environment, their profiles would not be deleted.

## Deleting VHD Files 
The script first searches for VHD profiles in a specified directory that are older than the specified date. In the case of this script, the value is set to **180 days**, but that value can be changed.

Once those VHD files are identified, they are written to a CSV for tracking of what is deleted as well as another CSV that tracks all historical deletions. *Writing to the CSV files is optional but nice for historical purposes*.

After the old VHD files are documented, they are then deleted from the specified directory. 

## Deleting Empty Folders
The second part of this script then deletes the empty folder in which the VHD files used to reside. The empty folders are written to a CSV file. A For loop is then used to loop through each folder path specified in the CSV file and delete that folder.

## Looping Through Directories
I chose to make it so the directories are looped through manually due to the amount of user data that gets deleted. Optionally, one could loop through each directory and make this an automated process.

