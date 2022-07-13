class NotToDo < ApplicationRecord
  belongs_to :user
  validates_presence_of :listdate, :name
  acts_as_list
end