class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :venue
end
