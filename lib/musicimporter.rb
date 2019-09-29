class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    file_check = Dir.entries(@path).collect { |files| files
  end
  
end