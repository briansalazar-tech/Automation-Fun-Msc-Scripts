import os

user_profiles = os.listdir(r'\\network\drive\location') # Directory containing user profile folders
configfile = open(r'\\path\to\text\configuration\file\textfile.txt', encoding='utf-16') # Text file
username_only = []
clean_list = []

# Parse username from folder name
print("Getting List of User Profiles in Folder Location")
for profile in user_profiles:
    username_only.append(profile.split("_")[0])
print(f"Total number of User Profiles: {len(username_only)}")

# Open Config file
print("\nReading config file")
names_in_file = configfile.readlines()
print(f"Total entries added to names_in_file list from [textfile].txt: {len(names_in_file)}")
configfile.close()

# Clean up entries in list. UTF-16 entires add \n to strings.
print("\nCleaning up the list (Removing New Line from string)")
for name in names_in_file:
    clean_list.append(name.split('\n')[0])
print(f"List entries cleaned up.\nTotal entries from [textfile].txt data after removing blank entries: {len(clean_list)}")

# Create lists of usernames listed in config file and not listed in the config file
user_in_config = []
user_not_in_config = []
for name in username_only:
    if name in clean_list:
        user_in_config.append(name)
    else:
        user_not_in_config.append(name)
print("\nComparing list of user profiles against config file")
print(f"Total user profiles that are listed in text file: {len(user_in_config)}")
print(f"Total user profiles not listed in the text file: {len(user_not_in_config)}")

# Save data to files lin listed directory
print(f"\nWriting data to file located in {os.getcwd()}")
with open("users_not_in_file.txt", mode="w") as file:
    for user in user_not_in_config:
        file.write(user + "\n")

with open("users_in_file.txt", mode="w") as file:
    for user in user_in_config:
        file.write(user + "\n")

print("Process Completed")