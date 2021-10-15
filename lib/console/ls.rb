# frozen_string_literal: true

# Shows the folders and files available within the folder
def ls
  $current_folder.folders.sort.to_h.each_key { |key| puts "./#{key}" }
  $current_folder.files.sort.to_h.each_key { |key| puts key.to_s }
end
