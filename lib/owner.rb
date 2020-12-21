class Owner
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.filter{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end

    Dog.all.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end