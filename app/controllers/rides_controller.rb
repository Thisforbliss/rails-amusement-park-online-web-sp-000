class RidesController < ApplicationController
    def index
        @attractions = Ride.all
    end
end
