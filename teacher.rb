require './person'

class Teacher < Person
  def initialize(age, name: 'Unknown', specialization: 'None')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
