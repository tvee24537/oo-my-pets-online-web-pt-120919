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

  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
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
    all_pets = []
    all_pets = cats + dogs
    all_pets.each do |p|
      p.owner = nil
      p.mood = "nervous"
    end 
  end

  def list_pets
		"I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
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