# frozen_string_literal: true

# Show current user info
def whoami
  puts "User: #{$current_user.username}"
  puts "Role: #{$current_user.role}"
end
