class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebies(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev)
    end

    def self.oldest_company
        self.order("founding_year").first
        #oldest_year = self.order("founding_year").first.founding_year
        #self.where(founding_year: oldest_year)
    end
end
