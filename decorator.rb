require './nameable'

class Decorator < Nameable
    def initialize(person)
        super()
        @nameable = person
    end

    def correct_name
        @nameable.correct_name
    end
end