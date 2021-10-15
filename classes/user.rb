# frozen_string_literal: true

# User class is used for creating users
class User
  def initialize(username, password = nil, role = 'regular')
    @username = username
    @password = password
    @role = role
  end

  attr_accessor :password
  attr_reader :username, :role
end
