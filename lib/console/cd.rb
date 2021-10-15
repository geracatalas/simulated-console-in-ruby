# frozen_string_literal: true

# Move user from one directory to another
def cd(go_to_folder)
  # cd with no arguments moves the user to the root directory and keeps it
  # in the same place if he enters ".." and he was already in that directory
  if go_to_folder.nil? || (go_to_folder == '..' && $current_folder.parent_folder.nil?)
    $current_folder = ROOT
  # Go back one directory
  elsif go_to_folder == '..' && !$current_folder.parent_folder.nil?
    $current_folder = $current_folder.parent_folder
  # Go to a directory
  elsif !go_to_folder.nil? && $current_folder.folders.key?(go_to_folder)
    $current_folder = $current_folder.folders[go_to_folder]
  else
    # Show an error if the folder does not exist
    puts "Error: Folder #{go_to_folder} does not exists"
  end
end
