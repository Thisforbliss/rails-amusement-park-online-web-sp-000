class Ride < ActiveRecord::Base
    belongs_to  :attraction
    belongs_to  :user

    def take_ride 
        enough_tickets, tall_enough = requirements
        #binding.pry
        if enough_tickets && tall_enough
            start_ride
        elsif !enough_tickets && tall_enough
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif enough_tickets && !tall_enough 
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        elsif !enough_tickets && !tall_enough
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    
        end
    end

    def requirements
        enough_tickets, tall_enough = false
        if self.user.tickets >= self.attraction.tickets
            enough_tickets = true
            #binding.pry
        end
        if self.user.height >= self.attraction.min_height
            tall_enough = true
        end
        return [enough_tickets, tall_enough]
    
    end
    


    def start_ride
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            new_nausea = self.user.nausea + self.attraction.nausea_rating
            new_tickets = self.user.tickets - self.attraction.tickets
            self.user.update(
            :happiness => new_happiness,
            :nausea => new_nausea,
            :tickets => new_tickets)
            "Thanks for riding the #{self.attraction.name}!"
    end


end

