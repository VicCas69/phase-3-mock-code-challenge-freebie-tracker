class Dev < ActiveRecord::Base

    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        #Dev.name
        arr_names = []
        self.freebies.each do |t|
            arr_names << t.item_name
        end
        arr_names.include?(item_name)
    end

    def give_away(dev, freebie)
        if self.recieved_one?(freebie.item_name)
            freebie.update
            #freebie.dev_id= dev.id
        else 
            "This freebie does not belong to #{self.name}"
        end 
    end
end
