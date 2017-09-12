module Ageable
    extend ActiveSupport::Concern

    def get_age(birth_date)
        age = Date.today.year - birth_date.year
    end
end