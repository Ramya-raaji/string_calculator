# app/lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.strip.empty?

    delimiter = /,|\n/
    if numbers.start_with?("//")
      delimiter_part, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(delimiter_part[2])
      delimiter = /#{delimiter}/
    end

    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
    end

    nums.sum
  end
end
