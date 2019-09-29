class Song
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end
 
    def genre=(genre)
        @genre = genre 
       genre.songs << self unless genre.songs.include?(self)
    end
    
    def self.find_by_name(name)
      all.detect {|song| song.name == name}
    end 
    
    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
    
    def self.new_from_filename(filename)
     name = filename.split(" - ")[0]
     artist = filename.split(" - ")[1]
     genre = filename.split(" - ")[2]
     
     song = Song.find_or_create_by_name(name)
     end
  
end