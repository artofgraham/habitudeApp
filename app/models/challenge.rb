class Challenge < ApplicationRecord
  belongs_to :user
  validates_presence_of :cdate, :name
  acts_as_list
end