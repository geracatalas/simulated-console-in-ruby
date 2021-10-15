# frozen_string_literal: true

# Logout the user
def logout
  $current_user = ROOT.users['default_user']
end
