require './decorator'

class TrimmerDecorator < Decorator
    def correct_name
        @nameable.correct_name.length > 10?
        @nameable.correct_name[0..9] :
        @nameable.correct_name
    end
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name