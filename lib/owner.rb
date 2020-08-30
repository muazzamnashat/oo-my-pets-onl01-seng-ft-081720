class Owner
  # code goes here
  attr_reader :name , :species  
  @@all=[]
  def initialize(name)
    @name=name
    @species="human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self} 
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self} 
  end

  def buy_cat(name)
    Cat.new(name,self)
  
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood= "happy"}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood= "happy"}
  end

  def sell_pets
    self.cats.each do |cat|
      cat.owner= nil
      cat.mood= "nervous"
    end

    self.dogs.each do |dog|
      dog.owner= nil
      dog.mood= "nervous"
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end