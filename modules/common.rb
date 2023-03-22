module CommonModule
  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print "\e[31mEnter valid date format [yyyy-mm-dd]: \e[0m"
      answer = gets.chomp
      validate_date(answer)
    end
  end

  def empty?(text)
    if text.empty? || text == ''
      print "\e[31mEnter valid data: \e[0m"
      answer = gets.chomp
      empty?(answer)
    else
      text
    end
  end
end
