# frozen_string_literal: true

require 'yaml'
# require classes
Dir["#{File.dirname(__FILE__)}/classes/**/*.rb"].sort.each { |file| require file }
# require functions
require './lib/remove_string_quotes'
require './lib/console'
require './lib/save_if_persists'

# Checks if the user wants to save the status of the program execution
SAVE_DATA = !ARGV.nil? && (ARGV[0] == '-persisted') && !ARGV[1].nil?
# If save_data is equal to 'true' it checks if a data file with yaml format already exists
if SAVE_DATA && (File.exist? ARGV[1])
  # Read the data file and set the constant 'root' with that data
  ROOT = YAML.safe_load(File.read(ARGV[1]), permitted_classes: [Root, Folder, User, VirtualFile], aliases: true)

  # Create the data file if it does not exist and edit it if it exists
  save_if_persists
else
  # Create main folder without a parent folder
  ROOT = Root.new('~', nil)
  # Create superuser 'sudo' without password
  sudo = User.new('sudo', nil, 'super')
  ROOT.add_user(sudo)
  # Create the default_user user
  # This user has read-only permissions and is the user set by default when starting the program
  default_user = User.new('default_user', nil, 'read_only')
  ROOT.add_user(default_user)
end

# Set user 'default_user' as current user and folder 'root' as current folder when starting the program
$current_folder = ROOT
$current_user = ROOT.users['default_user']

# Start and keep the console in loop
console
