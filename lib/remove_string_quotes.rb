# frozen_string_literal: true

# Remove quotes from a string
def remove_string_quotes(string_with_quotes)
  if string_with_quotes.start_with?("'") && string_with_quotes.end_with?("'")
    string_with_quotes.delete_prefix("'").delete_suffix("'")
  elsif string_with_quotes.start_with?('"') && string_with_quotes.end_with?('"')
    string_with_quotes.delete_prefix('"').delete_suffix('"')
  else
    string_with_quotes
  end
end
