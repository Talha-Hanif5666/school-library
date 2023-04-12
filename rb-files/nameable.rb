class Nameable
  def correct_name
    raise not_implemented_error, "#{self.class} has not implemented method '#{__method__}'"
  end
end
