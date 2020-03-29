class Serviceprovider < ApplicationRecord
  
  has_many :services 

  #  has_and_belongs_to_many :teachers
  has_many :orders
  has_many :consumers , :through => :orders
end
