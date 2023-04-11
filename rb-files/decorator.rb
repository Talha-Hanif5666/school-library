require './nameable'
class Decorator < Nameable
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
