# frozen_string_literal: true

# This function checks if the user wants to save the state of the program's execution
# inside a .yaml file so that later the program can be executed again from that state
def save_if_persists
  return nil unless SAVE_DATA

  File.open(ARGV[1], File::RDWR | File::CREAT, 0o644) do |f|
    f.flock(File::LOCK_EX)
    f.rewind
    f.write(YAML.dump(ROOT))
    f.flush
    f.truncate(f.pos)
  end
end
