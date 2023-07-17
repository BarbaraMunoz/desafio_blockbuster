class Client < ApplicationRecord
  belongs_to :movie, optional: true, dependent: :destroy

  def to_s
    self.name
  end  
end
