module Concerns::Findable
  
  def find_by_name(name)
    self.all.detect { |element| element.name == name }
  end
  
end