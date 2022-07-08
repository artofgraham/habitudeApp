class Tracker < ApplicationRecord
  belongs_to :user
  has_many :days
  validates_presence_of :habitdate, :title, :intention
end