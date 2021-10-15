# frozen_string_literal: true

# Folder class is used for creating directories and storing files
class Folder
  def initialize(name, parent_folder)
    @name = name
    # Stores the created folders inside a folder
    @folders = {}
    # Stores the created files inside a folder
    @files = {}
    # When a subfolder is created it stores the parent folder in this variable
    # this then allows to move from one folder to another using the cd command
    @parent_folder = parent_folder
    # Stores the directory path
    @folder_path = name
  end

  attr_accessor :name, :folder_path
  attr_reader :folders, :parent_folder, :files

  # Create a folder
  def add_folder(folder)
    # Check that a folder or file with that name does not already exist in the same location
    if (@files.key? folder.name) || (@folders.key? folder.name)
      puts "Error: A file or folder with the name \"#{folder.name}\" already exists"
    else
      @folders[folder.name] = folder
      @folders[folder.name].save_folder_path
    end
  end

  # Create a file
  def add_file(file)
    # Check that a folder or file with that name does not already exist in the same location
    if (@files.key? file.name) || (@folders.key? file.name)
      puts "Error: A file or folder with the name \"#{file.name}\" already exists"
    else
      @files[file.name] = file
    end
  end

  # Save the folder path
  def save_folder_path
    @folder_path.insert(0, "#{@parent_folder.name}/") if @parent_folder
  end
end
