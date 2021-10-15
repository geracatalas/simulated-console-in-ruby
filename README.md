# Simulated "bash" console in ruby

## Ruby & Project Versions
* Ruby: 2.7.4
* Project: 1.0.0

## Available Commands
* cd -> Move user from one directory to another
  * Usage: cd
  * Usage: cd ..
  * Usage: cd folder_name
* create_file -> Create a file
  * Usage: create_file file_name
  * Usage: create_file folder_name file_content
* create_folder -> Create a folder
  * Usage: create_folder folder_name
* create_user -> Create a user
  * Usage: create_user username
  * Usage: create_user username password
  * Usage: create_user username -role=role
  * Usage: create_user username password -role=role
  * Available roles: 'super', 'regular' and 'read_only'. By default the empty role sets 'regular' as the role for the new user
* delete_password -> Delete the user's password
  * Usage: delete_password
* destroy_user -> Delete a user
  * Usage: destroy_user username
* destroy -> Delete a folder or file
  * Usage: destroy file_or_folder_name
* exit -> Close the program
  * Usage: exit
* login -> Login with a user
  * Usage: login username password
* logout -> Logout the user
  * Usage: logout
* ls -> Shows the folders and files available within the folder
  * Usage: ls
* metadata -> Show the metadata of a file
  * Usage: metadata file_name
* rename -> Rename a folder or file
  * Usage: rename current_file_or_folder_name new_name
* show -> Show file content
  * Usage: show file_name
* sudo -> Quick access to login with sudo user. It's an alias of 'login sudo password'
  * Usage: sudo password
* update_content -> Replaces the content of a file with a new one
  * Usage: update_content file_name new_content
  * Empty new_content removes content from file
* update_password -> Change the password of the current user
  * Usage: update_password new_password
* whereami -> Show directory path
  * Usage: whereami
* whoami -> Show current user info
  * Usage: whoami