class Address < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :street_1, :street_2, :city, :state, :zip
end
