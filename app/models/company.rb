require 'pry'
class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        binding.pry
        Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
    end

    def self.oldest_company
        Company.order(founding_year: :asc).first
    end
end