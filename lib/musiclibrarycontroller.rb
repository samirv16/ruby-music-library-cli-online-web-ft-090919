class MusicLibraryController
  

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end 
  
  def call
    puts "Welcome!"
  end
  
end