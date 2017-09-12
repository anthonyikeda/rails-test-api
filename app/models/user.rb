class User < ApplicationRecord
    include Ageable
        
    has_many :events, dependent: :destroy
    has_one :addresses, dependent: :destroy

    validates_presence_of :name, :email, :dob
end
