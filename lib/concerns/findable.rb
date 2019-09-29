module Concerns::Findable
  
  def find_by_name(name)
    self.all.detect { |element| element.name == name }
  end
  
  def find_or_create_by_name(name)
    self.all.detect { |element| element.name == name } || self.new
  end
  
end