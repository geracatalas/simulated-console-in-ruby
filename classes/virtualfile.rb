# frozen_string_literal: true

require 'date'

# VirtualFile class is used for creating files
# This class cannot be called "File" because one with that name already exists in the Ruby core
class VirtualFile
  def initialize(name, content = nil)
    @name = name
    @content = content
    # Save the file creation date
    @creation_date = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
    # Save the date of the file last modification
    @last_modification = creation_date
  end

  attr_reader :name, :content, :creation_date, :last_modification

  def content=(content)
    @content = content
    @last_modification = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
  end

  def name=(name)
    @name = name
    @last_modification = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
  end

  # Show the metadata
  def metadata
    <<~HEREDOC
      ############################################
      METADATA

      File Name: #{name}
      Creation Date: #{creation_date}
      Last Modification: #{last_modification}
      ############################################
    HEREDOC
  end
end
