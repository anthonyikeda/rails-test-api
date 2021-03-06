class User < ApplicationRecord
    has_many :events, dependent: :destroy

    validates_presence_of :name, :email, :address
end
