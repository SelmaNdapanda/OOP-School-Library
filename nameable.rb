class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} is not implemented"
  end
end
