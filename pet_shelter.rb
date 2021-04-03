class Pet
  attr_accessor :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner 
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def name
    first_initial, last_name = @name.split
    last_name.capitalize!
    "#{first_initial} #{last_name}"
  end

  def number_of_pets
    @pets.size
  end
end                                                        

class Shelter
  def initialize
    @pets = []
    @owners = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    @pets << pet unless @pets.include?(pet)
    @owners << owner unless @owners.include?(owner)
  end

  def print_adoptions
    @owners.each do |o|
      puts "#{o.name} has adopted the following pets:"
      o.pets.each do |p|
        puts "\ta #{p.type} name #{p.name}"
      end
      puts
    end
  end
end                                                                       

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

