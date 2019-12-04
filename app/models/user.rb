class User < ActiveRecord::Base
    has_secure_password

    def mood
        if self.happiness != nil && self.nausea != nil
        if self.happiness > self.nausea
            #binding.pry
            "#{self.name} Mood is happy. They have #{self.tickets} tickets and is #{self.height} inches in height."
        else
            "sad"
        end
        end
    end

end
