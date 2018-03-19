module DogsRelated
  NBR_OF_DOGS_NEEDED_TO_START_A_DOG_PARTY = 5
  class Dog
    def bark
      puts "Woof..."
    end
 
    def eat
      puts "..."
    end
    
    def wag_tail
      puts "I'm doing this because I'm happy"
    end
 
    def give_the_paw
      puts "Why??"
    end
  end  
end
 
x = 5
charlie = DogsRelated::Dog.new
charlie.eat if x >= DogsRelated::NBR_OF_DOGS_NEEDED_TO_START_A_DOG_PARTY