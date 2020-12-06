class DayTwo::Validator
  def validate(validate_type, password, char, left, right)
    if validate_type == :occurrences
      occurrences = password.count(char)
      occurrences >= left && occurrences <= right
    elsif validate_type == :position
      ((password[left - 1] == char && password[right - 1] != char) || (password[left - 1] != char && password[right - 1] == char)) && !(password[left - 1] == char && password[right - 1] == char)
    end
  end
end