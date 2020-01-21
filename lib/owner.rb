class Owner
  @@all= []
  attr_accessor :pets
  attr_reader :species, :name

  def initialize(name, species = "human")
    @species = species
    @@all << self
    @@pets = {:dogs => [], :cats => []}
    @name = name
  end

  def say_species
    return "I am a #{@species}."
  end
  
	def dogs
	  Dog.all.select do |d|
	    d.owner == self
	  end
	end

  def cats
    Cat.all.select do |c|
      c.owner == self
    end
  end

  def buy_cat(name, owner)
    Cat.new(name, owner)
  end
  
  def buy_dog(name_of_dog)
    @@pets[:dogs] << Dog.new(name_of_dog)
  end

  def walk_dogs
    Dog.all.each do |d|
      d.mood = "happy"
    end
   end

  def feed_cats
    Cat.all.each do |c|
      c.mood = "happy"
    end
  end

  def sell_pets
    @@pets.collect do |species, instances|
      instances.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      instances.clear
    end
  end

  def list_pets
    @@pets.each do |pets|
      puts pets.name
    end
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end
end