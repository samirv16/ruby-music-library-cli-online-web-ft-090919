class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    file_check = Dir.entries(@path).select { |files| files.include?("mp3") }
  end
  
end