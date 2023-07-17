class Movie < ApplicationRecord
  has_many :clients

  accepts_nested_attributes_for :clients, allow_destroy: true
  def to_s
    self.name
  end  
end

