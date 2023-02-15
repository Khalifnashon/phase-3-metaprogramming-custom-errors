require "pry"
class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  # We need to tell our program to raise our brand new PartnerError when 
  # the argument passed into the #get_married method is not an instance of 
  # the Person class. We can do that with the raise keyword. 
  
  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      # raising and rescuing error
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    end
  end
  # you'll see that not only is our custom error message printed out but the 
  # program continues to run and will execute the puts beyonce.name line:

  # Defining a custom error class, PartnerError that inherits from StandardError:
  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end

  end

end

# original error:
# As it currently stands, we would receive a NoMethodError if we try to pass #get_married
# an argument of anything that is not an instance of the Person class (that is, a class 
# without a #partner= method defined).

# For example, at the bottom of our lib/custom_errors.rb file, we're trying to tell Beyonce 
# to #get_married to "Jay-Z". The problem is that "Jay-Z" is a string, not an instance of 
# the Person class.

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name

binding.pry




