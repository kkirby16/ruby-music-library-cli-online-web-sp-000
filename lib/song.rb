require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    if artist != nil 
      self.artist = artist 
    end
    if genre != nil 
      self.genre = genre
    end
  save
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
       @artist = artist
  artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
    @genre.songs << self
  end
  end
  
  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
  end
end
  #   # Song.artist = artist 
  #   # Artist.song << Song
  #   # #if initialize is called with artist or genre arguments
