# frozen_string_literal: true

# Show directory path
def whereami
  if $current_folder.folder_path.start_with?('~/')
    puts $current_folder.folder_path.delete_prefix('~')
  else
    puts '/'
  end
end
