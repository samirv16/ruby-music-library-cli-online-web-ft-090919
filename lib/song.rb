class Song
  
  attr_accessor :name, :artist, :genre
  # attr_reader 
  
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
     artist = filename.split(" - ")[0].delete(".mp3")
     name = filename.split(" - ")[1].delete(".mp3")
     genre = filename.split(" - ")[2].delete(".mp3")
     
     song = Song.find_or_create_by_name(name)
     artist = Artist.find_or_create_by_name(artist)
     genre = Genre.find_or_create_by_name(genre)
     song.artist = artist
     song.genre = genre
     song
     end
  
end