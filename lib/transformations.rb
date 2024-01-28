module Transformations

  def letters_to_numbers
    letters_to_numbers = {}

    ('A'..'H').each_with_index do |letter, index|
    letter_to_number[letter] = index
    end

    letters_to_numbers
  end

end
