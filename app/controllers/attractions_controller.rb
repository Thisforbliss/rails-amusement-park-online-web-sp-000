class AttractionsController < ApplicationController
   def index
    @attractions = Attraction.all
   end

   def new
   @attraction = Attraction.new
   end

   
   def show
     #binding.pry
      @attraction = Attraction.find_by(id: params[:id])
      @ride = @attraction.rides.build(user_id: current_user.id)
     
   end

   def create
   
   end
end
