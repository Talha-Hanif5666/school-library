require_relative './nameable'
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class Capitalize < Decorator
  def correct_name
    super.capitalize
  end
end

class Trimmer < Decorator
  def correct_name
    super.strip.slice(0, 10)
  end
end
