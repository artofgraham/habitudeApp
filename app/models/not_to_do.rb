class NotToDo < ApplicationRecord
  belongs_to :user
  validates_presence_of :listdate, :name
end
