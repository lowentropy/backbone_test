class Todo < ActiveRecord::Base
  
  default_scope order(:position)
  
  validates :text, :presence => true
  
  acts_as_list
  
end
