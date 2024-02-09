### DIRECTORIES ###
# "\\folder1\subfolder1\subfolder2"
# "\\folder2\subfolder1\subfolder2"
# "\\folder3\subfolder1\subfolder2"
 
$current_date = Get-Date
$days_back = (Get-Date).AddDays(-180)
$directory = "\\folder1\subfolder1\subfolder2"

clear-host

# DELETE OLD VHDS
# Get VHD Files olders than 180 days. VHDs.csv lists the drives deleted in CURRENT run. VHDs Total.csv lists all the drives that have been deleted. After CSVs are writte, VHD files that meet criteria are deleted.
Write-Host "Todays date is: $current_date"
Write-Host "180 days ago was: $days_back"
Write-Host "VHD files that have not been modified since this date will be deleted."
Write-Host "Begining VHD deletion... Writing to CSV files..."
Get-ChildItem -Path $directory -Recurse -Filter "*.VHD*" | Where-Object{$_.lastwritetime -lt $days_back} | Export-csv -Path "Filepath\VHDs.csv" # VHD files deleted on current run
Get-ChildItem -Path $directory -Recurse -Filter "*.VHD*" | Where-Object{$_.lastwritetime -lt $days_back} | Export-csv -Path "Filepath\VHDs TOTAL.csv" -Append # All VHD files deleted historically
Get-ChildItem -Path $directory -Recurse -Filter "*.VHD*" | Where-Object{$_.lastwritetime -lt $days_back} | Remove-Item # Delete VHD file
Write-Host "The VHDs in the following CSV file were deleted - Filepath\VHDs.csv"

# DELETE EMPTY FOLDERS
Write-Host "The folders/sub-folders written to the CSV file are empty and will be deleted. - Filepath\Empty Folders.csv"
# Folders that meet the criteria specied are written to the Empty Folders csv file. CSV is overwritten every time script is ran. 
(Get-ChildItem -Path $directory -Recurse | Where-Object {$_.PSIsContainer -eq $True}) | Where-Object {$_.GetFiles().Count -eq 0 } | Where-Object { $_.GetDirectories().Count -eq 0 } | Select-Object FullName
| Export-csv -Path "Filepath\Empty Folders.csv"
# Folders listed in csv file are passed through for loop and deleted based on the Fullname(File path) header.
$csvfile = "Filepath\Empty Folders.csv"
$Folders = Import-Csv -Path $csvfile
Write-Host "Deleting empty folders. Get some coffee or sit and wait...."
foreach ($folder in $Folders) {
    if (Test-Path $folder.FullName) {
    # Write-Host "Folder Deleted: $folder" - If hunderds of empty folders are present, this will return a lot of unecessary lines
    Remove-Item $folder.FullName -Recurse -Force
}
    else
    {
    Write-Host "Folder Doesn't Exists: $folder"
    }
}
Write-Host "Empty folders have been deleted."
