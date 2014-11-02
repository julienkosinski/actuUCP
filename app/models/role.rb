class Role < ActiveRecord::Base
  has_many :users
  
  scopify
end
